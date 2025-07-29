import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../repository/app_local_repository.dart';

class SetThemeModeUseCase implements BaseUseCase<ThemeMode, void> {
  SetThemeModeUseCase({
    required AppLocalRepository appLocalRepository,
  }) : _appLocalRepository = appLocalRepository;

  final AppLocalRepository _appLocalRepository;

  @override
  AsyncResult<void> call(ThemeMode input) async {
    return await _appLocalRepository.setThemeMode(themeMode: input);
  }
}
