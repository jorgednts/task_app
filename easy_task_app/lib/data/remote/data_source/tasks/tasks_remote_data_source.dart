import '../../model/task/easy_task_response.dart';

abstract class TasksRemoteDataSource {
  Future<List<EasyTaskResponse>> getAllTasks();

  Future<EasyTaskResponse> createTask({required Map<String, dynamic> params});

  Future<void> updateTask({required Map<String, dynamic> params});

  Future<void> deleteTask({required String id});
}
