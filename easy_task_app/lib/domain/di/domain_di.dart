import 'package:get_it/get_it.dart';

import '../repository/auth_repository.dart';
import '../use_case/auth/get_auth_state_changes.dart';
import '../use_case/auth/get_current_user_use_case.dart';
import '../use_case/auth/register_user_use_case.dart';
import '../use_case/auth/sign_in_use_case.dart';
import '../use_case/auth/sign_out_use_case.dart';

abstract class DomainDI {
  static void getIt() {
    final getIt = GetIt.instance;
    final authRepository = getIt.get<AuthRepository>();
    getIt
      ..registerFactory<RegisterUserUseCase>(
        () => RegisterUserUseCase(
          authRepository: authRepository,
        ),
      )
      ..registerFactory<GetCurrentUserUseCase>(
        () => GetCurrentUserUseCase(
          authRepository: authRepository,
        ),
      )
      ..registerFactory<SignOutUseCase>(
        () => SignOutUseCase(
          authRepository: authRepository,
        ),
      )
      ..registerFactory<GetAuthStateChangedUseCase>(
        () => GetAuthStateChangedUseCase(
          authRepository: authRepository,
        ),
      )
      ..registerFactory<SignInUseCase>(
        () => SignInUseCase(
          authRepository: authRepository,
        ),
      );
  }
}
