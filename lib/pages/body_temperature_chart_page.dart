import 'package:flutter/material.dart';
import '../data/body_temperature_data.dart';
import '../i18n/i18n.dart';
import '../widgets/body_temperature_bar_chart.dart';

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

    //final BodyTemperatureLineChart _bodyTemperatureChart = BodyTemperatureLineChart();
    //_bodyTemperatureChart.update(bodyTemperatureHistory: _bodyTemperatureData.bodyTemperatureHistory);

    final BodyTemperatureBarChart _bodyTemperatureChart = BodyTemperatureBarChart();
    //_bodyTemperatureChart.update(bodyTemperatureHistory: _bodyTemperatureData.bodyTemperatureHistory);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize(PhraseKey.bodyTemperature)),
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
