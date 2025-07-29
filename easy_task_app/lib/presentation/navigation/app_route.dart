import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/user/easy_task_user_model.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../ui/auth/auth_page.dart';
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
    routes: [],
  );
}
