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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
             Expanded(child: _bodyTemperatureChart),
            ]
          )
        ),
      ),
    );
  }
}
