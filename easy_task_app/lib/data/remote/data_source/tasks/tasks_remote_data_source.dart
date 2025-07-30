import '../../../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../model/task/easy_task_response.dart';

abstract class TasksRemoteDataSource {
  Future<List<EasyTaskResponse>> getTasks({
    required GetTasksFiltersParams filters,
  });

  Future<EasyTaskResponse> createTask({required Map<String, dynamic> params});

  Future<void> updateTask({required Map<String, dynamic> params});

  Future<void> deleteTask({required String id});
}
