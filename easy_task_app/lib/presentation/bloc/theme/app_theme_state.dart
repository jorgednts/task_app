import 'package:flutter/material.dart';

sealed class AppThemeState {
  const AppThemeState({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  String get displayName;

  IconData get icon;
}

class SystemThemeState extends AppThemeState {
  const SystemThemeState() : super(themeMode: ThemeMode.system);

  @override
  String get displayName => 'System';

  @override
  IconData get icon => Icons.brightness_auto;
}

class DarkThemeState extends AppThemeState {
  const DarkThemeState() : super(themeMode: ThemeMode.dark);

  @override
  String get displayName => 'Dark';

  @override
  IconData get icon => Icons.nights_stay;
}

class LightThemeState extends AppThemeState {
  const LightThemeState() : super(themeMode: ThemeMode.light);

  @override
  String get displayName => 'Light';

  @override
  IconData get icon => Icons.light_mode;
}
