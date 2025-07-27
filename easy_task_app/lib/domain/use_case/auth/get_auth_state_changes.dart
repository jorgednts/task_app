import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../repository/auth_repository.dart';

class GetAuthStateChangedUseCase
    extends BaseUseCase<NoParam, Stream<AuthState>> {
  GetAuthStateChangedUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  AsyncResult<Stream<AuthState>> call(NoParam input) async {
    return Result.ok(_authRepository.authStateChanges);
  }
}
