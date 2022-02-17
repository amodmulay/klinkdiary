import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'file_descriptors.dart';

/*
// **** TEST CODE ***
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var fileDesc = const FileDescriptor(name: "abc.json");

  await FileStorage.read(fileDescriptor: fileDesc);
  await FileStorage.write(fileDescriptor: fileDesc, content : "my content");
  var content = await FileStorage.read(fileDescriptor: fileDesc);
  print("content: $content");

}
*/

class FileStorage {

  static Future<Map<String, dynamic>> readAsJsonMap({required FileDescriptor fileDescriptor}) async {
    var jsonString = await read(fileDescriptor: fileDescriptor);

    if (jsonString.isEmpty) {
      return Future.value(<String, dynamic> {});
    } else {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Future<Map<String, dynamic>>.value(jsonMap);
    }
  }

  static writeAsJson({required FileDescriptor fileDescriptor, required Map<String, dynamic> jsonMap}) async {
    final String jsonString = jsonEncode(jsonMap);
    await write(fileDescriptor: fileDescriptor, content: jsonString);
  }

  static Future<String> read({required FileDescriptor fileDescriptor}) async {
    try {
      var path = await _buildPath(fileDescriptor : fileDescriptor);
      var file = File(path);
      final String context = await file.readAsString();

      return context;
    } catch (e) {
      print("Couldn't read file" + e.toString());
      return "";
    }
  }

  static write({required FileDescriptor fileDescriptor, required String content}) async {
    var path = await _buildPath(fileDescriptor : fileDescriptor);
    var file = File(path);
    await file.writeAsString(content);
  }

  static Future<String> _buildPath({required FileDescriptor fileDescriptor}) async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path + '/' + fileDescriptor.name;
  }

}