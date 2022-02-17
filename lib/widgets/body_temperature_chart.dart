import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';

import 'formats.dart';

int displayDaysInPast = 14;

class BodyTemperatureChart extends StatelessWidget {

  final List<FlSpot> spots = List<FlSpot>.empty(growable: true);

  BodyTemperatureChart({Key? key}) : super(key: key);

  update({required List<BodyTemperatureRecord> bodyTemperatureHistory}) {
    List<BodyTemperatureRecord> bodyTemperatureHistoryToDisplay = bodyTemperatureHistory
        .where((bodyTemp) => bodyTemp.dateTime.isAfter(DateTime.now().subtract(Duration(days: displayDaysInPast))))
        .toList();

    spots.clear();
    for (var bodyTemperatureRecord in bodyTemperatureHistoryToDisplay) {
      spots.add(_createFlSpot(bodyTemperatureRecord));
    }
  }

  FlSpot _createFlSpot(BodyTemperatureRecord bodyTemperatureRecord) {
    return FlSpot(
        bodyTemperatureRecord.dateTime.millisecondsSinceEpoch.toDouble(), bodyTemperatureRecord.bodyTemperature);
  }

  void add(BodyTemperatureRecord bodyTemperatureRecord) {
    spots.add(_createFlSpot(bodyTemperatureRecord));
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      _lineChartData,
    );
  }

  LineChartData get _lineChartData => LineChartData(
        lineTouchData: _lineTouchData,
        gridData: _gridData,
        titlesData: _titlesData,
        borderData: _borderData,
        lineBarsData: _lineBarsData,
        minX: DateTime.now().subtract(Duration(days: displayDaysInPast)).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime.now().millisecondsSinceEpoch.toDouble(),
        minY: 35,
        maxY: 42,
      );

  FlGridData get _gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff9fb3ce),
            strokeWidth: 1,
            dashArray: [1, 8],
          );
        },
      );

  LineTouchData get _lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: _bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: _leftTitles(
          getTitles: (value) {
            return '${value.toInt()} °C';
          },
        ),
      );

  List<LineChartBarData> get _lineBarsData => [_lineChartBarData()];

  SideTitles _leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.blue,
          fontSize: 14,
        ),
      );

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        margin: 10,
        interval: 4 * 24 * 60 * 60 * 1000,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
        getTitles: (value) => (value % 100000 > 0) ? "" : Formats.dateFormatDaMo.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData _lineChartBarData() {
    return LineChartBarData(
      colors: [Colors.blue],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }

}
