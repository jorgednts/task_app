import 'package:core/core.dart';

import '../../repository/auth_repository.dart';

class SignOutUseCase implements BaseUseCase<NoParam, void> {
  SignOutUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  AsyncResult<void> call(NoParam input) async {
    return await _authRepository.signOut();
  }
}
