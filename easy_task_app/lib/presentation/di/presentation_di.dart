import 'package:get_it/get_it.dart';

import '../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../domain/use_case/auth/get_current_user_use_case.dart';
import '../../domain/use_case/auth/register_user_use_case.dart';
import '../../domain/use_case/auth/sign_in_use_case.dart';
import '../../domain/use_case/auth/sign_out_use_case.dart';
import '../../domain/use_case/categories/create_category_use_case.dart';
import '../../domain/use_case/categories/delete_category_use_case.dart';
import '../../domain/use_case/categories/edit_category_use_case.dart';
import '../../domain/use_case/categories/get_categories_use_case.dart';
import '../../domain/use_case/local/get_theme_mode_use_case.dart';
import '../../domain/use_case/local/set_theme_mode_use_case.dart';
import '../../domain/use_case/tasks/create_task_use_case.dart';
import '../../domain/use_case/tasks/delete_task_use_case.dart';
import '../../domain/use_case/tasks/edit_task_use_case.dart';
import '../../domain/use_case/tasks/get_tasks_use_case.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/categories/categories_event.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../bloc/tasks/tasks_event.dart';
import '../bloc/theme/app_theme_bloc.dart';

abstract class PresentationDI {
  static void getIt() {
    final getIt = GetIt.instance;
    getIt
      ..registerFactory(
        () => AppThemeBloc(
          getThemeModeUseCase: getIt.get<GetThemeModeUseCase>(),
          setThemeModeUseCase: getIt.get<SetThemeModeUseCase>(),
        ),
      )
      ..registerFactory(
        () => AuthBloc(
          registerUserUseCase: getIt.get<RegisterUserUseCase>(),
          signInUseCase: getIt.get<SignInUseCase>(),
          getCurrentUserUseCase: getIt.get<GetCurrentUserUseCase>(),
        )..add(const AuthGetCurrentUser()),
      )
      ..registerFactory(
        () =>
            TasksBloc(
                signOutUseCase: getIt.get<SignOutUseCase>(),
                getCategoriesUseCase: getIt.get<GetCategoriesUseCase>(),
                getTasksUseCase: getIt.get<GetTasksUseCase>(),
                createTaskUseCase: getIt.get<CreateTaskUseCase>(),
                editTaskUseCase: getIt.get<EditTaskUseCase>(),
                deleteTaskUseCase: getIt.get<DeleteTaskUseCase>(),
              )
              ..add(const InitializeCategories())
              ..add(
                const InitializeTasks(filtersParams: GetTasksFiltersParams()),
              ),
      )
      ..registerFactory(
        () => CategoriesBloc(
          getCategoriesUseCase: getIt.get<GetCategoriesUseCase>(),
          createCategoryUseCase: getIt.get<CreateCategoryUseCase>(),
          editCategoryUseCase: getIt.get<EditCategoryUseCase>(),
          deleteCategoryUseCase: getIt.get<DeleteCategoryUseCase>(),
        )..add(const InitCategories()),
      );
  }
}
