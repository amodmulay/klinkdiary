import 'package:flutter/material.dart';
import '../i18n/i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'pages.dart';
import '../theme/constants.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget _bodyTemperaturePageButton = ReusableCard(
        color: kActiveCardColor,
        child: IconContent(
            label: context.localize(PhraseKey.bodyTemperature),
            icon: FontAwesomeIcons.temperatureHigh
        ),
        onTap: () {
          Navigator.pushNamed(context, Pages.bodyTemperatureList);
        }
    );

    final Widget _bloodPressurePageButton = ReusableCard(
        color: kActiveCardColor,
        child: IconContent(
          label: context.localize(PhraseKey.bloodPressure),
          icon: FontAwesomeIcons.heart,
        ),
        onTap: () {
          Navigator.pushNamed(context, Pages.bloodPressure);
        });


    return Scaffold(
        appBar: AppBar(title: Text(context.localize(PhraseKey.appName)), actions: [
          IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: context.localize(PhraseKey.appName),
                    applicationVersion: "0.0.1",

                    children: const [
                      Text("Developed by"),
                      Text(" Amod Mulay"),
                      Text(" Christian Felbermair")
                    ]);
              })
        ]),
        drawer: Drawer(
          child: ListView(children: [
            ListTile(
                leading: const Icon(FontAwesomeIcons.temperatureHigh),
                title: Text(context.localize(PhraseKey.bodyTemperature)),
                onTap: () {
                  Navigator.pushNamed(context, Pages.bodyTemperatureList);
                }),
            ListTile(
                leading: const Icon(FontAwesomeIcons.heart),
                title: Text(context.localize(PhraseKey.bloodPressure)),
                onTap: () {
                  Navigator.pushNamed(context, Pages.bloodPressure);
                })
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
                  _bloodPressurePageButton
                ],
              ),
            ),
          ),
        ));
  }
}
