import 'package:core/core.dart';

import '../model/tasks/easy_task_model.dart';
import '../model/tasks/params/create_task_params.dart';
import '../model/tasks/params/delete_media_params.dart';
import '../model/tasks/params/edit_task_params.dart';
import '../model/tasks/params/get_tasks_filter_params.dart';
import '../model/tasks/params/upload_media_params.dart';

abstract class TasksRepository {
  AsyncResult<List<EasyTaskModel>> getAllTasks({
    required GetTasksFiltersParams filtersParams,
  });

  AsyncResult<EasyTaskModel> createTask({required CreateTaskParams params});

  AsyncResult<void> updateTask({required EditTaskParams params});

  AsyncResult<void> deleteTask({required String id});

  AsyncResult<void> uploadMediaFiles({required UploadMediaParams params});

  AsyncResult<void> deleteMediaFile({required DeleteMediaParams params});

  AsyncResult<EasyTaskModel> getTaskById({required String id});
}
