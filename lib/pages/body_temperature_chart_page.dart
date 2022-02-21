import 'package:flutter/material.dart';
import '../data/body_temperature_data.dart';
import '../widgets/body_temperature_chart.dart';


class BodyTemperatureChartPage extends StatelessWidget {
  const BodyTemperatureChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Object? args = ModalRoute.of(context)!.settings.arguments;

    late BodyTemperatureData _bodyTemperatureData;
    if (args == null) {
      _bodyTemperatureData = BodyTemperatureData(bodyTemperatureHistory: []);
    } else {
      _bodyTemperatureData = args as BodyTemperatureData;
    }

    final BodyTemperatureChart _bodyTemperatureChart = BodyTemperatureChart();
    _bodyTemperatureChart.update(bodyTemperatureHistory: _bodyTemperatureData.bodyTemperatureHistory);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Temperature"),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 600, width: 800, child: _bodyTemperatureChart),
                ],
              ),
            ),
          ),
        ));
  }
}
