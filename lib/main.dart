import 'package:flutter/material.dart';
import 'package:klinikdiary/pages/blood_pressure_input_page.dart';
import 'package:klinikdiary/pages/body_temperature_detail_page.dart';
import 'package:klinikdiary/pages/body_temperature_list_page.dart';
import 'package:klinikdiary/pages/body_temperature_chart_page.dart';
import 'package:klinikdiary/pages/homepage.dart';
import 'package:klinikdiary/pages/pages.dart';
import 'theme/klinik_theme.dart';
import 'pages/login_page.dart';


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
          Pages.bodyTemperatureList: (context) => const BodyTemperatureListPage(),
          Pages.bodyTemperatureChart: (context) => const BodyTemperatureChartPage(),
          Pages.bodyTemperatureDetails: (context) => const BodyTemperatureDetailPage(),
          Pages.bloodPressure: (context) =>   BloodPressureInputPage(),
        }
    );
  }
}

