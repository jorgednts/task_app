import 'package:core/core.dart';
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
import '../../domain/use_case/local/get_locale_use_case.dart';
import '../../domain/use_case/local/get_theme_mode_use_case.dart';
import '../../domain/use_case/local/set_locale_use_case.dart';
import '../../domain/use_case/local/set_theme_mode_use_case.dart';
import '../../domain/use_case/tasks/create_task_use_case.dart';
import '../../domain/use_case/tasks/delete_media_use_case.dart';
import '../../domain/use_case/tasks/delete_task_use_case.dart';
import '../../domain/use_case/tasks/edit_task_use_case.dart';
import '../../domain/use_case/tasks/get_task_by_id_use_case.dart';
import '../../domain/use_case/tasks/get_tasks_use_case.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/categories/categories_event.dart';
import '../bloc/global/global_bloc.dart';
import '../bloc/task_form/task_form_bloc.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../bloc/tasks/tasks_event.dart';

abstract class PresentationDI {
  static void getIt() {
    final getIt = GetIt.instance;
    getIt
      ..registerSingleton<MediaController>(
        MediaControllerImpl(
          logger: getIt.get<LoggerService>(),
        ),
      )
      ..registerFactory(
        () => GlobalBloc(
          getThemeModeUseCase: getIt.get<GetThemeModeUseCase>(),
          setThemeModeUseCase: getIt.get<SetThemeModeUseCase>(),
          getLocaleUseCase: getIt.get<GetLocaleUseCase>(),
          setLocaleUseCase: getIt.get<SetLocaleUseCase>(),
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
              getTasksUseCase: getIt.get<GetTasksUseCase>(),
            )..add(
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
      )
      ..registerFactory(
        () => TaskFormBloc(
          getCategoriesUseCase: getIt.get<GetCategoriesUseCase>(),
          createTaskUseCase: getIt.get<CreateTaskUseCase>(),
          editTaskUseCase: getIt.get<EditTaskUseCase>(),
          deleteTaskUseCase: getIt.get<DeleteTaskUseCase>(),
          deleteMediaUseCase: getIt.get<DeleteMediaUseCase>(),
          getTaskByIdUseCase: getIt.get<GetTaskByIdUseCase>(),
        ),
      );
  }
}
