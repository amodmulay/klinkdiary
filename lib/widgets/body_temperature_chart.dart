import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';

int displayDaysInPast = 14;

class BodyTemperatureChart extends StatelessWidget {
  final List<BodyTemperatureRecord> bodyTemperatureHistory;
  late final List<FlSpot> spots;

  BodyTemperatureChart({Key? key, required this.bodyTemperatureHistory}) : super(key: key) {
    List<BodyTemperatureRecord> bodyTemperatureHistoryToDisplay = bodyTemperatureHistory
        .where((bodyTemp) => bodyTemp.dateTime.isAfter(DateTime.now().subtract(Duration(days: displayDaysInPast))))
        .toList();

    spots = List<FlSpot>.generate(bodyTemperatureHistoryToDisplay.length,
            (index) => _createFlSpot(bodyTemperatureHistoryToDisplay.elementAt(index)),
        growable: true);
  }

  FlSpot _createFlSpot(BodyTemperatureRecord bodyTemperatureRecord) {
    return FlSpot(bodyTemperatureRecord.dateTime.millisecondsSinceEpoch.toDouble(), bodyTemperatureRecord.bodyTemperature);
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
    );
  }

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: DateTime.now().subtract(Duration(days: displayDaysInPast)).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime.now().millisecondsSinceEpoch.toDouble(),
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
        //bottomTitles: bottomTitles, TODO causes massive CPU load when activated
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
          fontSize: 16,
        ),
        getTitles: (value) {
          return "x";//formats.dateFormatDaMo.format(DateTime.fromMicrosecondsSinceEpoch(value.toInt()));
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
    return LineChartBarData(
      colors: [Colors.blue],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }

  void add(BodyTemperatureRecord bodyTemperatureRecord) {
    spots.add(FlSpot(bodyTemperatureRecord.dateTime.millisecondsSinceEpoch.toDouble(), bodyTemperatureRecord.bodyTemperature));
  }
}
