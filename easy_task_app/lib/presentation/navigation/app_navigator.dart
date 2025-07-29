import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/user/easy_task_user_model.dart';
import 'app_route.dart';

extension AppNavigator on BuildContext {
  void navigateToTasksPage({
    required EasyTaskUserModel easyTaskUserModel,
  }) {
    pushReplacementNamed(
      const TasksRoute().name,
      queryParameters: easyTaskUserModel.toQuery(),
    );
  }

  void signOut() {
    pushReplacementNamed(const AuthRoute().name);
  }
}
