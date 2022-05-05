import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinikdiary/widgets/horizontal_slider.dart';
import '../widgets/round_icon_button.dart';
import '../i18n/i18n.dart';
import '../theme/constants.dart';
import '../data/bp_record.dart';

class BloodPressureInputPage extends StatefulWidget {
  const BloodPressureInputPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputWidget();
}

class _InputWidget extends State<BloodPressureInputPage>
{
  final BPRecord _bpRecord = BPRecord.getNormalBPValues();

  @override
  Widget build(BuildContext context) {

    final HorizontalSlider _horizontalSlider = HorizontalSlider(
        maxValue: 180,
        minValue: 35,
        label: "bpm",
        currentSliderValue: _bpRecord.heartRate.toDouble());

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

    final _bpArea = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            context.localize(PhraseKey.systolic),
            style: kLabelTextStyle,
          ),
          Text(
            _bpRecord.systolic.toString(),
            style: kLargeNumberLabelTextStyle,
          ),
          Row(
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {},
              ),
              const SizedBox(width: 10),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                    },
              ),
            ],
          )
        ]),
        Column(
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
                  onPressed: () {
                    setState(() {
                      _bpRecord.diastolic = _bpRecord.diastolic+1;
                    });

                    print(_bpRecord.diastolic);
                  },
                ),
                const SizedBox(width: 10),
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      _bpRecord.diastolic = _bpRecord.diastolic-1;
                    });
                  },
                ),
              ],
            )
          ],
        )
      ],
    );

    final _heartRateArea =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                children: [_horizontalSlider])
          ])
    ]);
    final _bP = Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(height: 30),
      _bpArea,
      const SizedBox(height: 30),
      _heartRateArea,
      const SizedBox(height: 30),
      _dateTimePicker
    ]);
    final _widgetBp = Scaffold(
        appBar: AppBar(
          title: Text(context.localize(PhraseKey.bloodPressure)),
        ),
        body: _bP);

    return _widgetBp;
  }
}
