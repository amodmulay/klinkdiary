import 'package:flutter/material.dart';
import 'package:klinikdiary/widgets/ScalarInputVertical.dart';

class BodyTempaturePage extends StatelessWidget {
  const BodyTempaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ScalarInputVertical _bodyTemperature = ScalarInputVertical(
        min: 35.0, max: 42.0, divisions: 70, initialValue: 36.8);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Temperature"),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bodyTemperature],
              ),
            ),
          ),
        ));
  }
}
