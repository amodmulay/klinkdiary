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
        theme: theme,
        initialRoute: Pages.home,
        routes: {
          Pages.login: (context) => const LoginPage(),
          Pages.home: (context) => const Homepage(),
          Pages.bodyTemperatureOverview: (context) => BodyTemperatureOverviewPage(),
          Pages.bodyTemperatureDetails: (context) => const BodyTemperatureDetailPage(),
        }
    );
  }
}

