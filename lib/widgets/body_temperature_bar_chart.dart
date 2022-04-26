import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/body_temperature_record.dart';
import 'formats.dart';

const int displayDaysInPast = 21;
const int bottomTitlesGranularity = 4; // in days

class BodyTemperatureBarChart extends StatelessWidget {
  //final List<BarChartGroupData> barGroups = List<BarChartGroupData>.empty(growable: true);
  final List<BarChartGroupData> barGroups = [ BarChartGroupData(x: 1, barRods: [ BarChartRodData(toY: -1) ] ) ];

  BodyTemperatureBarChart({Key? key}) : super(key: key);

  update({required List<BodyTemperatureRecord> bodyTemperatureHistory}) {
    List<BodyTemperatureRecord> bodyTemperatureHistoryToDisplay = bodyTemperatureHistory
        .where((bodyTemp) => bodyTemp.dateTime.isAfter(DateTime.now().subtract(Duration(days: displayDaysInPast))))
        .toList();

    barGroups.clear();
    for (var bodyTemperatureRecord in bodyTemperatureHistoryToDisplay) {
      barGroups.add(_createBarGroup(bodyTemperatureRecord));
    }
  }

  BarChartGroupData _createBarGroup(BodyTemperatureRecord bodyTemperatureRecord) {
    //return BarChartGroupData(x: bodyTemperatureRecord.dateTime.millisecondsSinceEpoch, barRods: [
    return BarChartGroupData(x: 1, barRods: [
      BarChartRodData(
        toY: bodyTemperatureRecord.bodyTemperature,
        gradient: _barsGradientNormal,
      )
    ]);
  }

  void add(BodyTemperatureRecord bodyTemperatureRecord) {
    barGroups.add(_createBarGroup(bodyTemperatureRecord));
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        minY: 35,
        maxY: 42,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: _bottomTitles(),
        leftTitles: _leftTitles(),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  _leftTitles() => AxisTitles(
      sideTitles: SideTitles(
          showTitles: true, //
          reservedSize: 30, //
          getTitlesWidget: _leftTitleWidgetFunction));

  Widget _leftTitleWidgetFunction(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = value.toStringAsFixed(1);

    return Center(child: Text(text, style: style));
  }

  _bottomTitles() => AxisTitles(
          sideTitles: SideTitles(
        showTitles: true, //
        reservedSize: 30, //
        getTitlesWidget: _bottomTitleWidgetFunction, //
        interval: 1000.0 * 60 * 60 * 24 * bottomTitlesGranularity,
      ));

  Widget _bottomTitleWidgetFunction(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final String text =
        (value % 100000 > 0) ? "" : Formats.dateFormatDaMo.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));

    return Center(child: Text(text, style: style));
  }

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsGradientNormal = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.blueAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  final _barsGradientIncreased = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.yellowAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  final _barsGradientHigh = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.redAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

}
