import 'dart:ui';

import 'package:core/core.dart';

import '../../repository/app_local_repository.dart';

class SetLocaleUseCase implements BaseUseCase<Locale, void> {
  SetLocaleUseCase({
    required AppLocalRepository appLocalRepository,
  }) : _appLocalRepository = appLocalRepository;
  final AppLocalRepository _appLocalRepository;

  @override
  AsyncResult<void> call(Locale input) async {
    return await _appLocalRepository.setLocale(locale: input);
  }
}
