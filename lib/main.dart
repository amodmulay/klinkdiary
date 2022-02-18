import 'package:flutter/material.dart';
import 'package:klinikdiary/pages/body_tempature_detail_page.dart';
import 'package:klinikdiary/pages/body_temperature_overview_page.dart';
import 'package:klinikdiary/pages/homepage.dart';
import 'package:klinikdiary/pages/pages.dart';
import 'theme/klinik_theme.dart';
import 'package:klinikdiary/pages/login_page.dart';


void main() {
  runApp(const Klinikdiary());
}

class Klinikdiary extends StatelessWidget {
  const Klinikdiary({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final theme = KlinikTheme.dark();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: Pages.home,
        routes: {
          Pages.login: (context) => const LandingPage(title: "Klinik Diary"),
          Pages.home: (context) => const Homepage(),
          Pages.bodyTemperatureOverview: (context) => BodyTemperatureOverviewPage(),
          Pages.bodyTemperatureDetails: (context) => const BodyTemperatureDetailPage(),
        }
    );
  }
}

