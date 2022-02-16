import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';

DateFormat _dayMonthFormat = DateFormat("dd.MM.");

class BodyTemperatureChart extends StatelessWidget {
  final List<BodyTemperatureRecord> bodyTemperatureHistory;
  late final List<BodyTemperatureRecord> bodyTemperatureHistoryToDisplay;

  BodyTemperatureChart({Key? key, required this.bodyTemperatureHistory}) : super(key: key) {
    bodyTemperatureHistoryToDisplay = bodyTemperatureHistory.where((bodyTemp) => bodyTemp.dateTime.isAfter(DateTime.now().subtract(Duration(days: 14)))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData,
    );
  }

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 14,
        minY: 35,
        maxY: 42,
      );

  FlGridData get gridData => FlGridData(
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

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            return '${value.toInt()} °C';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData => [lineChartBarData()];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          return _dayMonthFormat.format(DateTime.now().add(Duration(days: -14 + value.toInt())));
        },
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData lineChartBarData() {
    List<FlSpot> spots = List<FlSpot>.generate(
        bodyTemperatureHistoryToDisplay.length,
            (index) => FlSpot(index.toDouble(), bodyTemperatureHistoryToDisplay.elementAt(index).bodyTemperature),
        growable: true)
    ;

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
