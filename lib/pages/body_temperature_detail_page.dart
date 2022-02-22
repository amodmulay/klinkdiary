import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../data/body_temperature_record.dart';
import '../widgets/double_input_vertical.dart';
import '../widgets/styles.dart';
import '../i18n/i18n.dart';

class BodyTemperatureDetailPage extends StatelessWidget {
  const BodyTemperatureDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // determine initial value
    final Object? args = ModalRoute.of(context)!.settings.arguments;

    final BodyTemperatureRecord _bodyTemperatureRecord;
    if (args == null) {
      _bodyTemperatureRecord = BodyTemperatureRecord.nowNormalTemperature();
    } else {
      _bodyTemperatureRecord = args as BodyTemperatureRecord;
    }

    final _dateTimePicker = DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: _bodyTemperatureRecord.dateTime.toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: const Icon(Icons.event),
      dateLabelText: context.localize(PhraseKey.date),
      timeLabelText: context.localize(PhraseKey.time),
      onChanged: (val) => _bodyTemperatureRecord.dateTime = DateTime.parse(val),
    );

    // body temperature input
    final DoubleInputVertical _bodyTemperatureInput =
        DoubleInputVertical(min: 35.0, max: 42.0, divisions: 70, value: _bodyTemperatureRecord.bodyTemperature);

    // save button
    final Widget _saveButton = ElevatedButton(
      style: Styles.buttonStyle,
      onPressed: () {
        _bodyTemperatureRecord.bodyTemperature = _bodyTemperatureInput.value;

        Navigator.pop(context, _bodyTemperatureRecord);
      },
      child: Text(context.localize(PhraseKey.save)),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(context.localize(PhraseKey.bodyTemperature)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_dateTimePicker, _bodyTemperatureInput, const SizedBox(height: 25.0), _saveButton],
            ),
          ),
        ));
  }
}
