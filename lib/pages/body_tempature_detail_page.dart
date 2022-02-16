import 'package:flutter/material.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';
import 'package:klinikdiary/widgets/double_input_vertical.dart';
import 'package:klinikdiary/widgets/styles.dart';

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
      child: const Text('Save'),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Temperature"),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bodyTemperatureInput, const SizedBox(height: 25.0), _saveButton],
              ),
            ),
          ),
        ));
  }
}
