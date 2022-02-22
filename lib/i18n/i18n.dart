import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PhraseKey { appName, bloodPressure, bodyTemperature, save, addNewRecord, date, time }

const String languageCodeEN = "en";
const String languageCodeDE = "de";

class AppLocalization {

  static const List<Locale> supportedLocales = [
    Locale.fromSubtags(languageCode: languageCodeEN),
    Locale.fromSubtags(languageCode: languageCodeDE),
  ];

  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) => Localizations.of<AppLocalization>(context, AppLocalization);

  static final Map<String, Map<PhraseKey, String>> _translations = {
    languageCodeEN: {
      PhraseKey.appName: "Klinik Diary",
      PhraseKey.bloodPressure: "Blood Pressure",
      PhraseKey.bodyTemperature: "Body Temperature",
      PhraseKey.save: "Save",
      PhraseKey.addNewRecord: "Add new record",
      PhraseKey.date: "Date",
      PhraseKey.time: "Time",
    },
    languageCodeDE: {
      PhraseKey.appName: "Klinik Diary",
      PhraseKey.bloodPressure: "Blutdruck",
      PhraseKey.bodyTemperature: "Körpertemperatur",
      PhraseKey.save: "Speichern",
      PhraseKey.addNewRecord: "Neuer Eintrag",
      PhraseKey.date: "Datum",
      PhraseKey.time: "Uhrzeit",
    }
  };
}

extension LocalizationExt on BuildContext {
  String localize(PhraseKey phraseKey) {
    final languageCode = AppLocalization.of(this)?.locale.languageCode ?? languageCodeEN;
    final translation = AppLocalization._translations;

    if (translation.containsKey(languageCode)) {
      return translation[languageCode]?[phraseKey] ?? "-";
    } else {
      return translation[languageCodeEN]?[phraseKey] ?? "-";
    }
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {

  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalization.supportedLocales.contains(locale);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;

}
