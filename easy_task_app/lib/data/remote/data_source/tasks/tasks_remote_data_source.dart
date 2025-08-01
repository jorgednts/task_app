import '../../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../../../domain/model/tasks/params/upload_media_params.dart';
import '../../model/task/easy_task_media_item_response.dart';
import '../../model/task/easy_task_response.dart';

abstract class TasksRemoteDataSource {
  Future<List<EasyTaskResponse>> getTasks({
    required GetTasksFiltersParams filters,
  });

  Future<EasyTaskResponse> createTask({required Map<String, dynamic> params});

  Future<void> updateTask({required Map<String, dynamic> params});

  Future<void> deleteTask({required String id});

  Future<List<EasyTaskMediaItemResponse>> uploadMediaFiles({
    required UploadMediaParams params,
  });

  Future<void> deleteMediaFile({required DeleteMediaParams params});

  Future<EasyTaskResponse> getTaskById({required String taskId});
}
