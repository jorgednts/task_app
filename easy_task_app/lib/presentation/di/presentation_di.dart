import 'package:get_it/get_it.dart';

import '../../domain/use_case/auth/get_current_user_use_case.dart';
import '../../domain/use_case/auth/register_user_use_case.dart';
import '../../domain/use_case/auth/sign_in_use_case.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/tasks/tasks_bloc.dart';

abstract class PresentationDI {
  static void getIt() {
    final getIt = GetIt.instance;
    getIt
      ..registerFactory(
        () => AuthBloc(
          registerUserUseCase: getIt.get<RegisterUserUseCase>(),
          signInUseCase: getIt.get<SignInUseCase>(),
          getCurrentUserUseCase: getIt.get<GetCurrentUserUseCase>(),
        ),
      )
      ..registerFactory(
        () => TasksBloc(),
      );
  }
}
