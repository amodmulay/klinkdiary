import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/i18n.dart';
import 'pages/body_temperature_detail_page.dart';
import 'pages/body_temperature_list_page.dart';
import 'pages/body_temperature_chart_page.dart';
import 'pages/homepage.dart';
import 'pages/pages.dart';
import 'pages/login_page.dart';
import 'theme/klinik_theme.dart';



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
        title: "",
        theme: theme,
        initialRoute: Pages.home,
        routes: {
          Pages.login: (context) => const LoginPage(),
          Pages.home: (context) => const Homepage(),
          Pages.bodyTemperatureList: (context) => const BodyTemperatureListPage(),
          Pages.bodyTemperatureChart: (context) => const BodyTemperatureChartPage(),
          Pages.bodyTemperatureDetails: (context) => const BodyTemperatureDetailPage(),
          Pages.bloodPressure: (context) =>   BloodPressureInputPage(),
        },
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalization.supportedLocales,
          
        }
    );
  }
}

