import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class AppLocalRepository {
  ThemeMode getThemeMode();

  AsyncResult<void> setThemeMode({required ThemeMode themeMode});

  Locale getLocale();

  AsyncResult<void> setLocale({required Locale locale});
}
