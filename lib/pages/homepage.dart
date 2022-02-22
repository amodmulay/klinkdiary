import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinikdiary/components/icon_content.dart';
import 'package:klinikdiary/components/reusable_card.dart';
import '../data/body_temperature_record.dart';
import '../widgets/styles.dart';
import 'pages.dart';
import '../theme/constants.dart';

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
        child: const Text('Body Temperature'));

    /* final Widget _bloodPreassurePageButton =
        ElevatedButton(style: Styles.buttonStyle, onPressed: () {}, child: const Text('Blood Pressure')); */

    final Widget _bloodPreassurePageButton = ReusableCard(
        color: kActiveCardColor,
        child: IconContent(
          label: 'Blood Pressure',
          icon: FontAwesomeIcons.heart,
        ),
        onTap: () {
          Navigator.pushNamed(context, Pages.bloodPressure);
        });

    return Scaffold(
        appBar: AppBar(title: const Text("Klink Diary"), actions: [
          IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: "Klinik Diary",
                    applicationVersion: "0.0.1",
                    children: const [
                      Text("Made by"),
                      Text(" Amod Mulay"),
                      Text(" Christian Felbermair")
                    ]);
              })
        ]),
        drawer: Drawer(
          child: ListView(children: [
            ListTile(
                leading: const Icon(Icons.thermostat),
                title: const Text("Body Temperature"),
                onTap: () {
                  Navigator.pushNamed(context, Pages.bodyTemperatureList,
                      arguments:
                          BodyTemperatureRecord.now(bodyTemperature: 37.5));
                }),
            ListTile(
                leading: const Icon(Icons.opacity),
                title: const Text("Blood Pressure"),
                onTap: () {})
          ]),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(36.0),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _bodyTemperaturePageButton,
                  const SizedBox(height: 10.0),
                  _bloodPreassurePageButton
                ],
              ),
            ),
          ),
        ));
  }
}
