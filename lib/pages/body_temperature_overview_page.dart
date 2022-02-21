import 'dart:math';

import 'package:flutter/material.dart';
import 'package:klinikdiary/data/body_temperature_record.dart';
import '../data/body_temperature_data.dart';
import '../persistence/file/file_descriptors.dart';
import '../persistence/file/file_storage.dart';
import '../widgets/body_temperature_chart.dart';
import '../widgets/formats.dart';
import '../widgets/styles.dart';
import 'pages.dart';

Random random = Random();
int day = 1;
final List<BodyTemperatureRecord> bodyTemperatureHistorySample = [
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
  BodyTemperatureRecord(
      dateTime: DateTime(2022, 2, day++, 8, 0, 1 + random.nextInt(58)),
      bodyTemperature: 35.0 + random.nextDouble() * 7.0),
];

class BodyTemperatureOverviewPage extends StatefulWidget {

  const BodyTemperatureOverviewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyTemperatureOverviewPageState();

}

class _BodyTemperatureOverviewPageState extends State<BodyTemperatureOverviewPage> {

  BodyTemperatureData _bodyTemperatureData = BodyTemperatureData(bodyTemperatureHistory: []);
  final BodyTemperatureChart _bodyTemperatureChart = BodyTemperatureChart();

  @override
  void initState() {
    Future<Map<String, dynamic>> bodyTemperatureJsonMapFuture = FileStorage.readAsJsonMap(fileDescriptor: FileDescriptors.bodyTemperature);
    bodyTemperatureJsonMapFuture.then((bodyTemperatureJsonMap) { update(bodyTemperatureJsonMap); });

    super.initState();
  }

  void update(Map<String, dynamic> bodyTemperatureJsonMap) {
    if (bodyTemperatureJsonMap.isEmpty) { // TODO remove is test code, empty map is fine when no data was recorded yet
      _bodyTemperatureData = BodyTemperatureData(bodyTemperatureHistory: bodyTemperatureHistorySample);
    } else {
      _bodyTemperatureData = BodyTemperatureData.fromJson(bodyTemperatureJsonMap);
    }

    _bodyTemperatureChart.update(bodyTemperatureHistory: _bodyTemperatureData.bodyTemperatureHistory);
  }

  @override
  Widget build(BuildContext context) {

    final Widget _bodyTemperatureDetailsButton = ElevatedButton(
        style: Styles.buttonStyle,
        onPressed: () {
          _addNewMeassurement(context);
        },
        child: const Text('Add'));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Temperature"),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 600, width: 800, child: _bodyTemperatureChart),
                  const SizedBox(height: 15),
                  _bodyTemperatureDetailsButton
                ],
              ),
            ),
          ),
        ));
  }

  void _addNewMeassurement(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Pages.bodyTemperatureDetails,
        arguments: BodyTemperatureRecord.nowNormalTemperature());

    if (result != null) {
      final BodyTemperatureRecord newBodyTemperatureRecord = result as BodyTemperatureRecord;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Recorded body temperature of  ${newBodyTemperatureRecord.bodyTemperature.toStringAsFixed(1)} °C"
            " at ${Formats.dateFormatDaMoYeHoMi.format(newBodyTemperatureRecord.dateTime)}."),
      ));

      _bodyTemperatureData.bodyTemperatureHistory.add(newBodyTemperatureRecord);
      _bodyTemperatureChart.add(newBodyTemperatureRecord); // TODO should better be implemented by observing the value list
    }
  }

}
