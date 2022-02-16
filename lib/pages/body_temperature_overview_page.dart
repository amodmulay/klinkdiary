import 'dart:math';

import 'package:flutter/material.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';
import '../widgets/body_temperature_chart.dart';
import '../widgets/styles.dart';
import 'pages.dart';

Random random = Random();
int day = 1;
final List<BodyTemperatureRecord> bodyTemperatureHistory = [
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
];

class BodyTemperatureOverviewPage extends StatelessWidget {
  const BodyTemperatureOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _bodyTemperatureDetailsButton = ElevatedButton(
        style: Styles.buttonStyle,
        onPressed: () {
          Navigator.pushNamed(context, Pages.bodyTemperatureDetails,
              arguments: BodyTemperatureRecord.now(bodyTemperature: 37.5));
        },
        child: const Text('Body Temperature'));

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
                children: <Widget>[
                  const SizedBox(height: 600, width: 800, child: BodyTemperatureChart()),
                  _bodyTemperatureDetailsButton
                ],
              ),
            ),
          ),
        ));
  }
}
