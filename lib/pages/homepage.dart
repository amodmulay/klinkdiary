import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

import '../data/body_temperature_record.dart';
import '../widgets/styles.dart';
import 'pages.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _bodyTemperaturePageButton = ElevatedButton(
        style: Styles.buttonStyle,
        onPressed: () {
          Navigator.pushNamed(context, Pages.bodyTemperatureList,
              arguments: BodyTemperatureRecord.now(bodyTemperature: 37.5));
        },
        child: Text(context.localize(PhraseKey.bodyTemperature)));

    final Widget _bloodPreassurePageButton =
        ElevatedButton(style: Styles.buttonStyle, onPressed: () {}, child: Text(context.localize(PhraseKey.bloodPressure)));

    return Scaffold(
        appBar: AppBar(title: Text(context.localize(PhraseKey.appName)), actions: [
          IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: context.localize(PhraseKey.appName),
                    applicationVersion: "0.0.1",
                    children: const []);
              })
        ]),
        drawer: Drawer(
          child: ListView(children: [
            ListTile(
                leading: const Icon(Icons.thermostat),
                title: Text(context.localize(PhraseKey.bodyTemperature)),
                onTap: () {
                  Navigator.pushNamed(context, Pages.bodyTemperatureList,
                      arguments: BodyTemperatureRecord.now(bodyTemperature: 37.5));
                }),
            ListTile(
                leading: const Icon(Icons.opacity),
                title: Text(context.localize(PhraseKey.bloodPressure)),
                onTap: () {})
          ]),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(36.0),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_bodyTemperaturePageButton, const SizedBox(height: 10.0), _bloodPreassurePageButton],
              ),
            ),
          ),
        ));
  }
}
