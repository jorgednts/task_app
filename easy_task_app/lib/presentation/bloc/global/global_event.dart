import 'package:flutter/material.dart';

sealed class GlobalEvent {
  const GlobalEvent();
}

class LoadTheme extends GlobalEvent {
  const LoadTheme();
}

class SwitchThemeMode extends GlobalEvent {
  const SwitchThemeMode();
}

class SetTheme extends GlobalEvent {
  const SetTheme({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}

class LoadLocale extends GlobalEvent {
  const LoadLocale();
}

class ChangeLocale extends GlobalEvent {
  const ChangeLocale({
    required this.locale,
  });

  final Locale locale;
}
