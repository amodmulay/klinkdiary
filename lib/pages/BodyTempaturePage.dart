import 'package:flutter/material.dart';
import 'package:klinikdiary/widgets/ScalarInputVertical.dart';

import '../main.dart';

class BodyTempaturePage extends StatelessWidget {
  const BodyTempaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // body temperature input
    final ScalarInputVertical _bodyTemperature =
        ScalarInputVertical(min: 35.0, max: 42.0, divisions: 70, initialValue: 36.8);

    // save button
    final ButtonStyle _style = ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20));
    final Widget _saveButton = ElevatedButton(
      style: _style,
      onPressed: () {
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
                children: <Widget>[_bodyTemperature, _saveButton],
              ),
            ),
          ),
        ));
  }
}
