import 'package:flutter/material.dart';
import 'package:klinikdiary/data/BodyTemperatureRecord.dart';
import 'package:klinikdiary/widgets/ScalarInputVertical.dart';

import '../main.dart';

class BodyTemperaturePage extends StatelessWidget {
  const BodyTemperaturePage({Key? key}) : super(key: key);

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
    final ScalarInputVertical _bodyTemperatureInput =
        ScalarInputVertical(min: 35.0, max: 42.0, divisions: 70, value: _bodyTemperatureRecord.bodyTemperature);

    // save button
    final ButtonStyle _style = ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20));
    final Widget _saveButton = ElevatedButton(
      style: _style,
      onPressed: () {
        _bodyTemperatureRecord.bodyTemperature = _bodyTemperatureInput.value;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Saved ${_bodyTemperatureRecord.bodyTemperature.toStringAsFixed(1)} °C"
              " at ${_bodyTemperatureRecord.dateTime}."),
        ));

        Navigator.pushNamed(context, PAGE_HOME);
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
