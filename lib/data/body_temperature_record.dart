
import 'package:json_annotation/json_annotation.dart';

import 'record.dart';

part 'body_temperature_record.g.dart';

// generate code by executing "flutter pub run build_runner build"

@JsonSerializable()
class BodyTemperatureRecord extends Record {

  double bodyTemperature;

  BodyTemperatureRecord({required DateTime dateTime, required this.bodyTemperature}) : super(dateTime: dateTime);

  static BodyTemperatureRecord nowNormalTemperature() {
    return BodyTemperatureRecord(dateTime: DateTime.now(), bodyTemperature: 36.8);
  }

  static BodyTemperatureRecord now({required double bodyTemperature}) {
    return BodyTemperatureRecord(dateTime: DateTime.now(), bodyTemperature: bodyTemperature);
  }

  factory BodyTemperatureRecord.fromJson(Map<String, dynamic> json) => _$BodyTemperatureRecordFromJson(json);

  Map<String, dynamic> toJson() => _$BodyTemperatureRecordToJson(this);

}