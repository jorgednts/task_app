import 'package:flutter/material.dart';

class GlobalState {
  const GlobalState({
    this.themeState = const SystemThemeState(),
    this.locale = defaultLocale,
  });

  final AppThemeState themeState;
  final Locale locale;

  static const defaultLocale = Locale('en');
  static const alternativeLocale = Locale('pt', 'BR');

  ThemeMode get themeMode => themeState.themeMode;

  IconData get icon => themeState.icon;

  String get displayName => themeState.displayName;

  String get localeName => locale.languageCode.substring(0, 2).toUpperCase();

  Locale get inverseLocale =>
      locale == defaultLocale ? alternativeLocale : defaultLocale;

  GlobalState copyWith({
    AppThemeState? themeState,
    Locale? locale,
  }) {
    return GlobalState(
      themeState: themeState ?? this.themeState,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlobalState &&
        other.themeState == themeState &&
        other.locale == locale;
  }

  @override
  int get hashCode => themeState.hashCode ^ locale.hashCode;
}

sealed class AppThemeState {
  const AppThemeState({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  String get displayName;

  IconData get icon;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppThemeState && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
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
