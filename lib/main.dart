import 'package:flutter/material.dart';
import 'package:klinikdiary/pages/BodyTempaturePage.dart';
import 'package:klinikdiary/pages/Homepage.dart';
import 'package:klinikdiary/pages/Pages.dart';
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
      initialRoute: PAGE_HOME,
      routes: {
        PAGE_LOGIN : (context) => const LoginPage(),
        PAGE_HOME: (context) => const Homepage(),
        PAGE_BODY_TEMPERATURE: (context) => const BodyTemperaturePage()
      }
    );
  }
}