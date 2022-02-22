import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../theme/constants.dart';
import '../pages/blood_pressure_input_page.dart';

class BPStore extends VxStore {
  int systolic = 100;
  int diastolic = 70;
  int heartRate = 70;

  @override
  String toString() {
    return "Systolic - $systolic, Diastolic - $diastolic, HeartRate - $heartRate";
  }
}

class LogInterceptor extends VxInterceptor {
  @override
  void afterMutation(VxMutation<VxStore?> mutation) {
    print("Current state - ${mutation.store.toString()}");
  }

  @override
  bool beforeMutation(VxMutation<VxStore?> mutation) {
    print("Previous state - ${mutation.store.toString()}");
    return true;
  }
}

class ChangeSystolic extends VxMutation<BPStore> {
  final int systolic;

  ChangeSystolic(this.systolic);
  @override
  perform() {
    store!.systolic = systolic;
  }
}

class ChangeDiastolic extends VxMutation<BPStore> {
  final int diastolic;

  ChangeDiastolic(this.diastolic);
  @override
  perform() {
    store!.diastolic = diastolic;
  }
}

class ChangeHeartRate extends VxMutation<BPStore> {
  final int heartRate;

  ChangeHeartRate(this.heartRate);
  @override
  perform() {
    store!.heartRate = heartRate;
  }
}