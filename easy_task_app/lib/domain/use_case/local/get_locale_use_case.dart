import 'dart:ui';

import 'package:core/core.dart';

import '../../repository/app_local_repository.dart';

class GetLocaleUseCase implements BaseUseCase<NoParam, Locale> {
  GetLocaleUseCase({
    required AppLocalRepository appLocalRepository,
  }) : _appLocalRepository = appLocalRepository;
  final AppLocalRepository _appLocalRepository;

  @override
  AsyncResult<Locale> call(NoParam input) async {
    return Result.ok(_appLocalRepository.getLocale());
  }
}
