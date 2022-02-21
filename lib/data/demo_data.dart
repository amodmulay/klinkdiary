import 'dart:math';
import 'body_temperature_record.dart';


Random random = Random();
int day = 1;
final List<BodyTemperatureRecord> bodyTemperatureHistorySample = [
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
];
