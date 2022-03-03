import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinikdiary/widgets/horizontal_slider.dart';
import '../widgets/round_icon_button.dart';
import '../i18n/i18n.dart';
import '../theme/constants.dart';
import '../data/bp_record.dart';

class BloodPressureInputPage extends StatelessWidget {
  const BloodPressureInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BPRecord _bpRecord = BPRecord.getNormalBPValues();
    final HorizontalSlider _horizontalSlider =
        HorizontalSlider(maxValue: 180, minValue: 35, currentSliderValue: 60);

    final _dateTimePicker = DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: _bpRecord.dateTime.toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: const Icon(Icons.event),
      dateLabelText: context.localize(PhraseKey.date),
      timeLabelText: context.localize(PhraseKey.time),
      onChanged: (val) => _bpRecord.dateTime = DateTime.parse(val),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize(PhraseKey.bloodPressure)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //BP area
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.localize(PhraseKey.systolic),
                              style: kLabelTextStyle,
                            ),
                            Text(
                              _bpRecord.systolic.toString(),
                              style: kLargeNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.localize(PhraseKey.diastolic),
                              style: kLabelTextStyle,
                            ),
                            Text(
                              _bpRecord.diastolic.toString(),
                              style: kLargeNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Heart Rate Area
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.localize(PhraseKey.heartRate),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _bpRecord.heartRate.toString(),
                              style: kLargeNumberLabelTextStyle,
                            ),
                            const Text(
                              " bpm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        _horizontalSlider,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Date Time area
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_dateTimePicker],
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
