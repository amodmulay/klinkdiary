
import 'package:json_annotation/json_annotation.dart';

import 'body_temperature_record.dart';

part 'body_temperature_data.g.dart';

// generate code by executing "flutter pub run build_runner build"

@JsonSerializable(explicitToJson: true)
class BodyTemperatureData {

  List<BodyTemperatureRecord> bodyTemperatureHistory;

  BodyTemperatureData({required this.bodyTemperatureHistory});

  factory BodyTemperatureData.fromJson(Map<String, dynamic> json) => _$BodyTemperatureDataFromJson(json);

  Map<String, dynamic> toJson() => _$BodyTemperatureDataToJson(this);

}