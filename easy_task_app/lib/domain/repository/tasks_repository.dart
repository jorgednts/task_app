import 'package:core/core.dart';

import '../model/tasks/create_task_params.dart';
import '../model/tasks/easy_task_model.dart';
import '../model/tasks/edit_task_params.dart';

abstract class TasksRepository {
  AsyncResult<List<EasyTaskModel>> getAllTasks();

  AsyncResult<EasyTaskModel> createTask({required CreateTaskParams params});

  AsyncResult<void> updateTask({required EditTaskParams params});

  AsyncResult<void> deleteTask({required String id});
}
