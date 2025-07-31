import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/tasks/easy_task_model.dart';
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

  Future<void> navigateToCategoriesPage() async{
    await pushNamed(const CategoriesRoute().name);
  }

  Future<bool?> navigateToTaskFormPage({
    required EasyTaskModel? easyTaskModel,
  }) async {
    if (easyTaskModel != null) {
      return await pushNamed<bool?>(
        const TaskFormRoute().name,
        queryParameters: easyTaskModel.toQuery(),
      );
    } else {
      return await pushNamed<bool?>(
        const TaskFormRoute().name,
      );
    }
  }

  void signOut() {
    pushReplacementNamed(const AuthRoute().name);
  }
}
