import 'app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension AppNavigator on BuildContext {
  void navigateToTasksPage() {
    pushReplacementNamed(TasksRoute().name);
  }
}
