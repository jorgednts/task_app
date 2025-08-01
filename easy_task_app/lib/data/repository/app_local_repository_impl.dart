import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/repository/app_local_repository.dart';
import '../local/data_source/app_local_data_source.dart';

class AppLocalRepositoryImpl implements AppLocalRepository {
  AppLocalRepositoryImpl({
    required AppLocalDataSource appLocalDataSource,
  }) : _appLocalDataSource = appLocalDataSource;

  final AppLocalDataSource _appLocalDataSource;

  @override
  ThemeMode getThemeMode() {
    return _appLocalDataSource.getThemeMode();
  }

  @override
  AsyncResult<void> setThemeMode({required ThemeMode themeMode}) async {
    try {
      await _appLocalDataSource.setThemeMode(themeMode: themeMode);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(
        GenericException(message: e.toString()),
      );
    }
  }

  @override
  Locale getLocale() {
    return _appLocalDataSource.getLocale();
  }

  @override
  AsyncResult<void> setLocale({required Locale locale}) async {
    try {
      _appLocalDataSource.setLocale(locale: locale);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(
        GenericException(message: e.toString()),
      );
    }
  }
}
