
import 'record.dart';

class BodyTemperatureRecord extends Record {

  double bodyTemperature;

  BodyTemperatureRecord({required DateTime dateTime, required this.bodyTemperature}) : super(dateTime: dateTime);

  static BodyTemperatureRecord nowNormalTemperature() {
    return BodyTemperatureRecord(dateTime: DateTime.now(), bodyTemperature: 36.8);
  }

  static BodyTemperatureRecord now({required double bodyTemperature}) {
    return BodyTemperatureRecord(dateTime: DateTime.now(), bodyTemperature: bodyTemperature);
  }

}