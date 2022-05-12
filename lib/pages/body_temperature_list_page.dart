import 'package:flutter/material.dart';
import '../data/body_temperature_record.dart';
import '../data/body_temperature_data.dart';
import '../data/demo_data.dart';
import '../i18n/i18n.dart';
import '../persistence/file/file_descriptors.dart';
import '../persistence/file/file_storage.dart';
import '../widgets/formats.dart';
import 'pages.dart';

class BodyTemperatureListPage extends StatefulWidget {
  const BodyTemperatureListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyTemperatureListPageState();
}

class _BodyTemperatureListPageState extends State<BodyTemperatureListPage> {
  BodyTemperatureData _bodyTemperatureData = BodyTemperatureData(bodyTemperatureHistory: []);
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  initState() {
    Future<Map<String, dynamic>> bodyTemperatureJsonMapFuture =
        FileStorage.readAsJsonMap(fileDescriptor: FileDescriptors.bodyTemperature);
    bodyTemperatureJsonMapFuture.then((bodyTemperatureJsonMap) {
      update(bodyTemperatureJsonMap);
    });

    super.initState();
  }

  update(Map<String, dynamic> bodyTemperatureJsonMap) {
    if (bodyTemperatureJsonMap.isEmpty) {
      // TODO remove is test code, empty map is fine when no data was recorded yet
      _bodyTemperatureData = BodyTemperatureData(bodyTemperatureHistory: bodyTemperatureHistorySample);
    } else {
      _bodyTemperatureData = BodyTemperatureData.fromJson(bodyTemperatureJsonMap);
    }

    _bodyTemperatureData.bodyTemperatureHistory.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    setState(() {});
  }

  addItem(BodyTemperatureRecord bodyTemperatureRecord) {
    setState(() {
      _bodyTemperatureData.bodyTemperatureHistory.add(bodyTemperatureRecord);
      _bodyTemperatureData.bodyTemperatureHistory.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );

    FileStorage.writeAsJson(fileDescriptor: FileDescriptors.bodyTemperature, jsonMap: _bodyTemperatureData.toJson());
  }

  updateItem(int index, BodyTemperatureRecord bodyTemperatureRecord) {
    setState(() {
      _bodyTemperatureData.bodyTemperatureHistory.removeAt(index);
      _bodyTemperatureData.bodyTemperatureHistory.insert(index, bodyTemperatureRecord);
      _bodyTemperatureData.bodyTemperatureHistory.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });

    FileStorage.writeAsJson(fileDescriptor: FileDescriptors.bodyTemperature, jsonMap: _bodyTemperatureData.toJson());
  }

  deleteItem(int index) {
    setState(() {
      _bodyTemperatureData.bodyTemperatureHistory.removeAt(index);
      _bodyTemperatureData.bodyTemperatureHistory.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });

    FileStorage.writeAsJson(fileDescriptor: FileDescriptors.bodyTemperature, jsonMap: _bodyTemperatureData.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final Widget _addItemButton = IconButton(
      icon: const Icon(
        Icons.add,
        color: Colors.blue,
        size: 35,
      ),
      tooltip: context.localize(PhraseKey.addNewRecord),
      onPressed: () {
        _addNewMessurement(context);
      },
    );

    var _listView = ListView.builder(
      itemCount: _bodyTemperatureData.bodyTemperatureHistory.length,
      itemBuilder: (_, index) => _createListItemEntry(index),
      reverse: true,
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize(PhraseKey.bodyTemperature)),
        actions: [
          IconButton(
              icon: const Icon(Icons.query_stats),
              onPressed: () {
                Navigator.pushNamed(context, Pages.bodyTemperatureChart, arguments: _bodyTemperatureData);
              }),
        ],
      ),
      body: Column(children: <Widget>[
        _addItemButton,
        Expanded(child: _listView),
      ]),
    );
  }

  Widget _createListItemEntry(int index) {
    var bodyTemperatureHistoryItem = _bodyTemperatureData.bodyTemperatureHistory[index];

    var dateString = Formats.dateFormatDaMo.format(bodyTemperatureHistoryItem.dateTime);
    var timeString = Formats.dateFormatHoMi.format(bodyTemperatureHistoryItem.dateTime);
    var bodyTemperatureString = '${bodyTemperatureHistoryItem.bodyTemperature.toStringAsFixed(1)} °C';

    return Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _editMessurement(context, index);
            },
            child: Text(dateString + ' ' + timeString + '  ' + bodyTemperatureString),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.blue),
            onPressed: () {
              var deleteConfirmed = showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text(context.localize(PhraseKey.confirmDeleteRecordTitle)),
                  content: Text(context.localize(PhraseKey.confirmDeleteRecordMessage)),
                  actions: [
                    TextButton( // approve
                        onPressed: () { Navigator.pop<bool>(context, true); },
                        child: Text(context.localize(PhraseKey.confirmDeleteRecordYes))),
                    TextButton( // deny
                        onPressed: () { Navigator.pop<bool>(context, false); },
                        child: Text(context.localize(PhraseKey.confirmDeleteRecordNo))),
                  ]
                );
              });
              deleteConfirmed.then((value) { if (value ?? false) { _deleteMessurement(context, index); } } );
            }
          )
        ]);
  }

  _editMessurement(BuildContext context, int index) async {
    var result = await Navigator.pushNamed(context, Pages.bodyTemperatureDetails,
        arguments: _bodyTemperatureData.bodyTemperatureHistory[index]);

    final BodyTemperatureRecord editedBodyTemperatureRecord = result as BodyTemperatureRecord;
    updateItem(index, editedBodyTemperatureRecord);
  }

  _addNewMessurement(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Pages.bodyTemperatureDetails,
        arguments: BodyTemperatureRecord.nowNormalTemperature());

    if (result != null) {
      final BodyTemperatureRecord newBodyTemperatureRecord = result as BodyTemperatureRecord;
      addItem(newBodyTemperatureRecord);
    }
  }

  _deleteMessurement(BuildContext context, int index) {
    deleteItem(index);
  }

}
