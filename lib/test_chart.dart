import 'package:flutter/material.dart';
import 'package:klinikdiary/widgets/body_temperature_chart.dart';

void main() {
  runApp(const MyChartApp());
}

class MyChartApp extends StatelessWidget {
  const MyChartApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
          body: Column(
          children: const [
            SizedBox( height: 600, width: 800,
              child: BodyTemperatureChart())
          ]
          ),
        ),
    );
  }
}



