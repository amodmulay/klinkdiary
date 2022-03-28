import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/widgets/formats.dart';
import '/data/body_temperature_record.dart';

const int displayDaysInPast = 21;
const int bottomTitlesGranularity = 4; // in days

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
        titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30,
                getTitlesWidget: _leftTitleWidgetFunction)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30,
              getTitlesWidget: _bottomTitleWidgetFunction,
              interval: 1000.0 * 60 * 60 * 24 * bottomTitlesGranularity, ))
        ),
        lineBarsData: _lineBarsData,
        minX: DateTime.now().subtract(Duration(days: displayDaysInPast)).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime.now().millisecondsSinceEpoch.toDouble(),
        minY: 35,
        maxY: 42,
      );

  Widget _leftTitleWidgetFunction(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = value.toStringAsFixed(1);
    return Center(child: Text(text, style: style));
  }

  Widget _bottomTitleWidgetFunction(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    final String text = (value % 100000 > 0) ? "" : Formats.dateFormatDaMo.format(DateTime.fromMillisecondsSinceEpoch(value.toInt()));

    return Center(child: Text(text, style: style));
  }


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
        touchTooltipData: LineTouchTooltipData(getTooltipItems: _lineTooltipItem,
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineTooltipItem> _lineTooltipItem(List<LineBarSpot> touchedSpots) {
    return touchedSpots.map((LineBarSpot touchedSpot) {
      final textStyle = TextStyle(
        color: touchedSpot.bar.gradient?.colors.first ??
            touchedSpot.bar.color ??
            Colors.blueGrey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      return LineTooltipItem(touchedSpot.y.toStringAsFixed(1) + " °C", textStyle);
    }).toList();
  }
  
  List<LineChartBarData> get _lineBarsData => [_lineChartBarData()];

  LineChartBarData _lineChartBarData() {
    return LineChartBarData(
      isCurved: true,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }
}
