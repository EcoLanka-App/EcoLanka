import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString('selected_language');

    if (languageCode != null) {
      _appLocale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    if (_appLocale == locale) return;

    _appLocale = locale;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'selected_language',
      locale.languageCode,
    );

    notifyListeners();
  }
}