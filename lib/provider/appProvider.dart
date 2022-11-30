import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = saveLanguage;

  ThemeMode appMode = saveMode;

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', appLanguage);
    notifyListeners();
  }

  Future<void> changeMode(ThemeMode newMode) async {
    if (appMode == newMode) {
      return;
    }
    appMode = newMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'mode', appMode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  bool isDarkMode() {
    return appMode == ThemeMode.dark;
  }
}
