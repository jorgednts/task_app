import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/local/get_theme_mode_use_case.dart';
import '../../../domain/use_case/local/set_theme_mode_use_case.dart';
import 'app_theme_event.dart';
import 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc({
    required GetThemeModeUseCase getThemeModeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
  }) : _getThemeModeUseCase = getThemeModeUseCase,
       _setThemeModeUseCase = setThemeModeUseCase,
       super(const SystemThemeState()) {
    _onInit();
  }

  final GetThemeModeUseCase _getThemeModeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;

  void _onInit() {
    on<LoadTheme>(_onLoadTheme);
    on<SwitchThemeMode>(_onSwitchTheme);
    on<SetTheme>(_onSetTheme);
  }

  Future<void> _onLoadTheme(
    LoadTheme event,
    Emitter<AppThemeState> emit,
  ) async {
    final result = await _getThemeModeUseCase(NoParam());

    result.fold(
      onOk: (themeMode) {
        final newState = _mapThemeModeToState(themeMode);
        emit(newState);
      },
      onError: (error) {},
    );
  }

  Future<void> _onSwitchTheme(
    SwitchThemeMode event,
    Emitter<AppThemeState> emit,
  ) async {
    final nextState = _getNextThemeState(state);
    emit(nextState);

    await _setThemeModeUseCase(nextState.themeMode);
  }

  Future<void> _onSetTheme(SetTheme event, Emitter<AppThemeState> emit) async {
    final newState = _mapThemeModeToState(event.themeMode);
    emit(newState);

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
}
