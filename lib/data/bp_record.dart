import '../data/record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bp_record.g.dart';

// generate code by executing "flutter pub run build_runner build"
@JsonSerializable()
class BPRecord extends Record {
  int systolic;
  int diastolic;
  int heartRate;

  BPRecord(
      {required DateTime dateTime,
      required this.systolic,
      required this.diastolic,
      required this.heartRate})
      : super(dateTime: dateTime);

  static BPRecord getNormalBPValues() {
    return BPRecord(
        dateTime: DateTime.now(), systolic: 110, diastolic: 70, heartRate: 65);
  }

  factory BPRecord.fromJson(Map<String, dynamic> json) =>
      _$BPRecordFromJson(json);

  Map<String, dynamic> toJson() => _$BPRecordToJson(this);
}
