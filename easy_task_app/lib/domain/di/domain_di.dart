import 'package:get_it/get_it.dart';

import '../repository/app_local_repository.dart';
import '../repository/auth_repository.dart';
import '../repository/categories_repository.dart';
import '../repository/tasks_repository.dart';
import '../use_case/auth/get_auth_state_changes.dart';
import '../use_case/auth/get_current_user_use_case.dart';
import '../use_case/auth/register_user_use_case.dart';
import '../use_case/auth/sign_in_use_case.dart';
import '../use_case/auth/sign_out_use_case.dart';
import '../use_case/categories/get_categories_use_case.dart';
import '../use_case/local/get_theme_mode_use_case.dart';
import '../use_case/local/set_theme_mode_use_case.dart';
import '../use_case/tasks/create_task_use_case.dart';
import '../use_case/tasks/delete_task_use_case.dart';
import '../use_case/tasks/edit_task_use_case.dart';
import '../use_case/tasks/get_tasks_use_case.dart';

abstract class DomainDI {
  static void getIt() {
    final getIt = GetIt.instance;
    final authRepository = getIt.get<AuthRepository>();
    final appLocalRepository = getIt.get<AppLocalRepository>();
    final categoriesRepository = getIt.get<CategoriesRepository>();
    final tasksRepository = getIt.get<TasksRepository>();
    getIt
      ..registerFactory<GetThemeModeUseCase>(
        () => GetThemeModeUseCase(
          appLocalRepository: appLocalRepository,
        ),
      )
      ..registerFactory<SetThemeModeUseCase>(
        () => SetThemeModeUseCase(
          appLocalRepository: appLocalRepository,
        ),
      )
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
      )
      ..registerFactory<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(
          categoriesRepository: categoriesRepository,
        ),
      )
      ..registerFactory<GetTasksUseCase>(
        () => GetTasksUseCase(
          tasksRepository: tasksRepository,
        ),
      )
      ..registerFactory<CreateTaskUseCase>(
        () => CreateTaskUseCase(
          tasksRepository: tasksRepository,
        ),
      )
      ..registerFactory<EditTaskUseCase>(
        () => EditTaskUseCase(
          tasksRepository: tasksRepository,
        ),
      )
      ..registerFactory<DeleteTaskUseCase>(
        () => DeleteTaskUseCase(
          tasksRepository: tasksRepository,
        ),
      );
  }
}
