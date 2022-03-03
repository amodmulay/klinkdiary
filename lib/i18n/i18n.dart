import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PhraseKey {
  //
  addNewRecord,
  appName,
  bloodPressure,
  bodyTemperature,
  confirmDeleteRecordMessage,
  confirmDeleteRecordNo,
  confirmDeleteRecordTitle,
  confirmDeleteRecordYes,
  date,
  save,
  time,
  settings,
  systolic,
  diastolic,
  heartRate
}

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
      PhraseKey.addNewRecord: "Add new record",
      PhraseKey.appName: "Klinik Diary",
      PhraseKey.bloodPressure: "Blood Pressure",
      PhraseKey.bodyTemperature: "Body Temperature",
      PhraseKey.confirmDeleteRecordNo: "No",
      PhraseKey.confirmDeleteRecordMessage: "Are you sure you want to delete this item?",
      PhraseKey.confirmDeleteRecordYes: "Delete",
      PhraseKey.confirmDeleteRecordTitle: "Delete",
      PhraseKey.date: "Date",
      PhraseKey.save: "Save",
      PhraseKey.time: "Time",
      PhraseKey.settings: "Settings",
      PhraseKey.systolic: "Systolic",
      PhraseKey.diastolic: "Diastolic",
      PhraseKey.heartRate: "Heart Rate",
    },
    languageCodeDE: {
      PhraseKey.addNewRecord: "Neuer Eintrag",
      PhraseKey.appName: "Klinik Diary",
      PhraseKey.bloodPressure: "Blutdruck",
      PhraseKey.bodyTemperature: "Körpertemperatur",
      PhraseKey.confirmDeleteRecordNo: "Nein",
      PhraseKey.confirmDeleteRecordMessage: "Wollen Sie die Daten wirklich löschen?",
      PhraseKey.confirmDeleteRecordYes: "Löschen",
      PhraseKey.confirmDeleteRecordTitle: "Löschen",
      PhraseKey.date: "Datum",
      PhraseKey.save: "Speichern",
      PhraseKey.time: "Uhrzeit",
      PhraseKey.settings: "Einstellungen",
      PhraseKey.systolic: "Systolic",
      PhraseKey.diastolic: "Diastolic",
      PhraseKey.heartRate: "Heart Rate",
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
  Future<AppLocalization> load(Locale locale) => SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
