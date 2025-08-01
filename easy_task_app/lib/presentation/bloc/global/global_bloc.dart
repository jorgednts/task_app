import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/local/get_locale_use_case.dart';
import '../../../domain/use_case/local/get_theme_mode_use_case.dart';
import '../../../domain/use_case/local/set_locale_use_case.dart';
import '../../../domain/use_case/local/set_theme_mode_use_case.dart';
import 'global_event.dart';
import 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc({
    required GetThemeModeUseCase getThemeModeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
    required GetLocaleUseCase getLocaleUseCase,
    required SetLocaleUseCase setLocaleUseCase,
  }) : _getThemeModeUseCase = getThemeModeUseCase,
       _setThemeModeUseCase = setThemeModeUseCase,
       _getLocaleUseCase = getLocaleUseCase,
       _setLocaleUseCase = setLocaleUseCase,
       super(const GlobalState()) {
    _onInit();
  }

  final GetThemeModeUseCase _getThemeModeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;
  final GetLocaleUseCase _getLocaleUseCase;
  final SetLocaleUseCase _setLocaleUseCase;

  void _onInit() {
    on<LoadTheme>(_onLoadTheme);
    on<SwitchThemeMode>(_onSwitchTheme);
    on<SetTheme>(_onSetTheme);

    on<LoadLocale>(_onLoadLocale);
    on<ChangeLocale>(_onChangeLocale);
  }

  Future<void> _onLoadTheme(
    LoadTheme event,
    Emitter<GlobalState> emit,
  ) async {
    final result = await _getThemeModeUseCase(NoParam());

    result.fold(
      onOk: (themeMode) {
        final newThemeState = _mapThemeModeToState(themeMode);
        emit(state.copyWith(themeState: newThemeState));
      },
      onError: (error) {},
    );
  }

  Future<void> _onSwitchTheme(
    SwitchThemeMode event,
    Emitter<GlobalState> emit,
  ) async {
    final nextThemeState = _getNextThemeState(state.themeState);
    emit(state.copyWith(themeState: nextThemeState));

    await _setThemeModeUseCase(nextThemeState.themeMode);
  }

  Future<void> _onSetTheme(SetTheme event, Emitter<GlobalState> emit) async {
    final newThemeState = _mapThemeModeToState(event.themeMode);
    emit(state.copyWith(themeState: newThemeState));

    await _setThemeModeUseCase(event.themeMode);
  }

  AppThemeState _getNextThemeState(AppThemeState currentState) {
    return switch (currentState) {
      SystemThemeState() => const LightThemeState(),
      LightThemeState() => const DarkThemeState(),
      DarkThemeState() => const SystemThemeState(),
    };
  }

  AppThemeState _mapThemeModeToState(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.system => const SystemThemeState(),
      ThemeMode.light => const LightThemeState(),
      ThemeMode.dark => const DarkThemeState(),
    };
  }

  Future<void> _onLoadLocale(
    LoadLocale event,
    Emitter<GlobalState> emit,
  ) async {
    final result = await _getLocaleUseCase(NoParam());
    result.fold(
      onOk: (locale) {
        emit(state.copyWith(locale: locale));
      },
      onError: (error) {},
    );
  }

  Future<void> _onChangeLocale(
    ChangeLocale event,
    Emitter<GlobalState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
    await _setLocaleUseCase(event.locale);
  }
}
