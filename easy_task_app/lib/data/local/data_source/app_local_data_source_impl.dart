import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_local_data_source.dart';
import 'constants/shared_preferences_constants.dart';

class AppLocalDataSourceImpl implements AppLocalDataSource {
  AppLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  ThemeMode getThemeMode() {
    try {
      final themeModeString = _sharedPreferences.getString(
        SharedPreferencesConstants.themeModeKey,
      );

      if (themeModeString != null) {
        return _stringToThemeMode(themeModeString);
      }

      return ThemeMode.system;
    } catch (e) {
      return ThemeMode.system;
    }
  }

  @override
  Future<void> setThemeMode({required ThemeMode themeMode}) async {
    try {
      final themeModeString = _themeModeToString(themeMode);
      _sharedPreferences.setString(
        SharedPreferencesConstants.themeModeKey,
        themeModeString,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to set theme mode: $e');
    }
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 'system';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
    }
  }

  ThemeMode _stringToThemeMode(String themeModeString) {
    switch (themeModeString) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Locale getLocale() {
    try {
      final localeString = _sharedPreferences.getString(
        SharedPreferencesConstants.localeKey,
      );
      if (localeString != null) {
        return Locale(localeString);
      }
      return const Locale('en');
    } catch (e) {
      return const Locale('en');
    }
  }

  @override
  Future<void> setLocale({required Locale locale}) async {
    try {
      await _sharedPreferences.setString(
        SharedPreferencesConstants.localeKey,
        locale.languageCode,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to set locale: $e');
    }
  }
}
