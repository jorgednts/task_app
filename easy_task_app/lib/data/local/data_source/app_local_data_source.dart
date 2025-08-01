import 'package:flutter/material.dart';

abstract class AppLocalDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode({required ThemeMode themeMode});

  Locale getLocale();

  Future<void> setLocale({required Locale locale});
}
