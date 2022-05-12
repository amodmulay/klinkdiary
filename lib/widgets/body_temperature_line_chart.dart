import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/widgets/formats.dart';
import '/data/body_temperature_record.dart';

const int displayDaysInPast = 21;
const int bottomTitlesGranularity = 4; // in days

const double maxTemperature = 42.0;
const double minTemperature = 35.0;

const double normalBodyTemperature = 36.6;

class BodyTemperatureLineChart extends StatelessWidget {
  final List<FlSpot> _allSpots = List<FlSpot>.empty(growable: true);
  final List<FlSpot> _peakByDaySpots = List<FlSpot>.empty(growable: true);

  BodyTemperatureLineChart({Key? key}) : super(key: key);

  update({required List<BodyTemperatureRecord> bodyTemperatureHistory}) {
    _allSpots.clear();
    _peakByDaySpots.clear();

    List<BodyTemperatureRecord> bodyTemperatureHistoryToDisplay = bodyTemperatureHistory
        .where((bodyTemp) => bodyTemp.dateTime.isAfter(DateTime.now().subtract(Duration(days: displayDaysInPast))))
        .toList();

    Map<DateTime, BodyTemperatureRecord> peaksByDay = <DateTime, BodyTemperatureRecord>{};

    for (int i = 0; i < bodyTemperatureHistoryToDisplay.length; i++) {
      final BodyTemperatureRecord bodyTemperatureRecord = bodyTemperatureHistoryToDisplay[i];
      _allSpots.add(_createFlSpot(bodyTemperatureRecord));

      final normalizedDate = _normalizeDate(bodyTemperatureRecord.dateTime);

      if (!peaksByDay.containsKey(normalizedDate) ||
          bodyTemperatureRecord.bodyTemperature > peaksByDay[normalizedDate]!.bodyTemperature) {
        peaksByDay[normalizedDate] = bodyTemperatureRecord;
      }
    }

    for (var element in peaksByDay.keys) {
      _peakByDaySpots.add(FlSpot(_toDouble(peaksByDay[element]!.dateTime), peaksByDay[element]!.bodyTemperature));
    }
  }

  FlSpot _createFlSpot(BodyTemperatureRecord bodyTemperatureRecord) {
    return FlSpot(_toDouble(bodyTemperatureRecord.dateTime), bodyTemperatureRecord.bodyTemperature);
  }

  //void add(BodyTemperatureRecord bodyTemperatureRecord) {
  //  spots.add(_createFlSpot(bodyTemperatureRecord));
  //}

  @override
  Widget build(BuildContext context) {
    return LineChart(
      _lineChartData,
    );
  }

  LineChartData get _lineChartData => LineChartData(
        //lineTouchData: _lineTouchData,
        gridData: _gridData,
        titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: _leftTitles(),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: _bottomTitles()),
        lineBarsData: _lineBarsData,
        minX: _toDouble(DateTime.now().subtract(const Duration(days: displayDaysInPast))),
        maxX: _toDouble(DateTime.now()),
        minY: minTemperature,
        maxY: maxTemperature,
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

  /*LineTouchData get _lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          //getTooltipItems: _lineTooltipItem,
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );*/

  /*List<LineTooltipItem> _lineTooltipItem(List<LineBarSpot> touchedSpots) {
    return touchedSpots.map((LineBarSpot touchedSpot) {
      final textStyle = TextStyle(
        color: touchedSpot.bar.gradient?.colors.first ?? touchedSpot.bar.color ?? Colors.blueGrey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      return LineTooltipItem(touchedSpot.y.toStringAsFixed(1) + " °C", textStyle);
    }).toList();
  }*/

  List<LineChartBarData> get _lineBarsData => [_spotsChartBarData(), _peakByDayChartBarData()];

  LineChartBarData _spotsChartBarData() {
    return LineChartBarData(
      barWidth: 0,
      showingIndicators: List<int>.generate(_allSpots.length, (int index) => index, growable: false),
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: 6,
          color: _spotColor(spot.y),
          //strokeWidth: 2,
          strokeColor: Colors.cyan,
        ),
      ),
      spots: _allSpots,
    );
  }

  Color _spotColor(double temperature) {
    if (temperature < normalBodyTemperature ) {
      return Color.fromARGB((255.0 * (normalBodyTemperature - temperature) / (normalBodyTemperature - minTemperature)).toInt(), 0, 0, 255);
    } else if (temperature == normalBodyTemperature ) {
      return Color.fromARGB(0, 255, 0, 255);
    } else  {
      return Color.fromARGB((255.0 * (temperature - normalBodyTemperature) / (maxTemperature - normalBodyTemperature)).toInt(), 255, 0, 0);
    }
  }

  LineChartBarData _peakByDayChartBarData() {
    return LineChartBarData(
      spots: _peakByDaySpots,
      isCurved: true,
      preventCurveOverShooting: true,
      dotData: FlDotData(
        show: false,
      ),
    );
  }

  double _toDouble(dateTime) => dateTime.millisecondsSinceEpoch.toDouble();

  DateTime _normalizeDate(DateTime dateTime) => DateTime(dateTime.year, dateTime.month, dateTime.day);
}
