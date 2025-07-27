import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'app_route.dart';

abstract class EasyTaskRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: routes.first.path,
    routes: routes.map((route) => route.goRoute).toList(),
  );

  static final routes = [
    AuthRoute(),
    TasksRoute(),
  ];
}
