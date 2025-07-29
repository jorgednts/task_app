import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../repository/app_local_repository.dart';

class GetThemeModeUseCase implements BaseUseCase<NoParam, ThemeMode> {
  GetThemeModeUseCase({
    required AppLocalRepository appLocalRepository,
  }) : _appLocalRepository = appLocalRepository;

  final AppLocalRepository _appLocalRepository;

  @override
  AsyncResult<ThemeMode> call(NoParam input) async {
    return Result.ok(_appLocalRepository.getThemeMode());
  }
}
