import 'package:flutter/material.dart';

abstract class AppLocalDataSource {
  ThemeMode getThemeMode();

  Future<void> setThemeMode({required ThemeMode themeMode});
}
