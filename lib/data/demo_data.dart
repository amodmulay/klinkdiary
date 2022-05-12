import 'dart:math';
import 'body_temperature_record.dart';


final Random random = Random();

const int daysBack = 30;
final DateTime initialDate = DateTime.now().subtract(const Duration(days: daysBack));

final List<BodyTemperatureRecord> bodyTemperatureHistorySample = _createSampleBodyTemps();

List<BodyTemperatureRecord> _createSampleBodyTemps() {
  List<BodyTemperatureRecord> samples = <BodyTemperatureRecord>[];

  for (int day = 0; day < daysBack; day++) {
    samples.add(BodyTemperatureRecord(
        dateTime: initialDate.add(Duration(days: day)),
        bodyTemperature: 35.0 + random.nextDouble() * 7.0));
  }

  return samples;
}
