import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/tasks/easy_task_model.dart';
import '../../domain/model/user/easy_task_user_model.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/task_form/task_form_bloc.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../ui/auth/auth_page.dart';
import '../ui/categories/categories_page.dart';
import '../ui/task_form/task_form_page.dart';
import '../ui/tasks/tasks_page.dart';

sealed class AppRoute {
  const AppRoute({
    required this.path,
    required this.name,
  });

  RouteBase get goRoute;

  final String path;
  final String name;
}

final class AuthRoute extends AppRoute {
  const AuthRoute()
    : super(
        path: '/',
        name: 'auth',
      );

  @override
  RouteBase get goRoute => GoRoute(
    path: path,
    name: name,
    builder: (_, state) => BlocProvider<AuthBloc>(
      create: (context) => GetIt.instance.get<AuthBloc>(),
      child: const AuthPage(),
    ),
    routes: [],
  );
}

final class TasksRoute extends AppRoute {
  const TasksRoute()
    : super(
        path: '/tasks',
        name: 'tasks',
      );

  @override
  RouteBase get goRoute => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => BlocProvider<TasksBloc>(
      create: (_) => GetIt.instance.get<TasksBloc>(),
      child: TasksPage(
        user: EasyTaskUserModel.fromQuery(state.uri.queryParameters),
      ),
    ),
    routes: [
      const CategoriesRoute().goRoute,
      const TaskFormRoute().goRoute,
    ],
  );
}

final class CategoriesRoute extends AppRoute {
  const CategoriesRoute()
    : super(
        path: 'categories',
        name: 'categories',
      );

  @override
  RouteBase get goRoute => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => BlocProvider<CategoriesBloc>(
      create: (_) => GetIt.instance.get<CategoriesBloc>(),
      child: const CategoriesPage(),
    ),
    routes: [],
  );
}

final class TaskFormRoute extends AppRoute {
  const TaskFormRoute()
    : super(
        path: 'form',
        name: 'task_form',
      );

  @override
  RouteBase get goRoute => GoRoute(
    path: path,
    name: name,
    builder: (context, state) {
      return BlocProvider<TaskFormBloc>(
      create: (_) => GetIt.instance.get<TaskFormBloc>(),
      child: TaskFormPage(
        task: state.uri.queryParameters.isEmpty
            ? null
            : EasyTaskModel.fromQuery(
                state.uri.queryParameters,
              ),
      ),
    );
    },
  );
}
