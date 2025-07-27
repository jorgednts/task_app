import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth/auth_bloc.dart';
import '../ui/auth/auth_page.dart';
import '../ui/tasks/tasks_page.dart';

sealed class AppRoute<BlocType extends Bloc> {
  const AppRoute({
    required this.path,
    required this.name,
    required this.child,
    this.routes = const [],
  });

  GoRoute get goRoute => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => BlocProvider<BlocType>(
      create: (context) => GetIt.instance.get<BlocType>(),
      child: child,
    ),
    routes: [],
  );

  final String path;
  final String name;
  final Widget child;
  final List<GoRoute> routes;
}

final class AuthRoute extends AppRoute<AuthBloc> {
  AuthRoute()
    : super(
        path: '/',
        name: 'auth',
        child: const AuthPage(),
      );
}

final class TasksRoute extends AppRoute<AuthBloc> {
  TasksRoute()
    : super(
        path: '/tasks',
        name: 'tasks',
        child: const TasksPage(),
      );
}
