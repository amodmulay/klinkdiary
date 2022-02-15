import 'package:flutter/material.dart';
import 'package:klinikdiary/pages/BodyTempaturePage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final Widget _bodyTemperaturePageButton = ElevatedButton(
      style: _style,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BodyTempaturePage();
        }));
      },
      child: const Text('Body Temperature'),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Klink Diary"),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(36.0),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bodyTemperaturePageButton],
              ),
            ),
          ),
        ));
  }
}
