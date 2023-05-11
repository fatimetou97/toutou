import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale? Locale_currentLocale = new Locale("fr");
  // static Locale swissFrench = new Locale('fr');

  Locale? get currentLocale => Locale_currentLocale;

  set _currentLocale(Locale? _currentLocale) {}

  void changeLocale(String _locale) {
    this._currentLocale = new Locale(_locale);

    notifyListeners();
  }
}
