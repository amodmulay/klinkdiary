import 'package:flutter/material.dart';

import '../data/body_temperature_record.dart';
import '../widgets/styles.dart';
import 'pages.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _bodyTemperaturePageButton = ElevatedButton(
      style: Styles.buttonStyle,
      onPressed: () {
        Navigator.pushNamed(context, Pages.bodyTemperatureOverview,
            arguments: BodyTemperatureRecord.now(bodyTemperature: 37.5));
      },
      child: const Text('Body Temperature')
    );

    final Widget _bloodPreassurePageButton = ElevatedButton(
        style: Styles.buttonStyle,
        onPressed: () {

        },
        child: const Text('Blood Pressure')
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Klink Diary")
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(36.0),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bodyTemperaturePageButton, const SizedBox(height: 10.0), _bloodPreassurePageButton],
              ),
            ),
          ),
        ));
  }
}
