import 'package:flutter/material.dart';

sealed class AppThemeEvent {
  const AppThemeEvent();
}

class LoadTheme extends AppThemeEvent {
  const LoadTheme();
}

class SwitchThemeMode extends AppThemeEvent {
  const SwitchThemeMode();
}

class SetTheme extends AppThemeEvent {
  const SetTheme({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}
