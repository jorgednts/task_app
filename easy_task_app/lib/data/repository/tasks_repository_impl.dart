import 'package:core/core.dart';

import '../../domain/model/tasks/easy_task_model.dart';
import '../../domain/model/tasks/params/create_task_params.dart';
import '../../domain/model/tasks/params/edit_task_params.dart';
import '../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../domain/repository/tasks_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/tasks/tasks_remote_data_source.dart';

class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl({
    required TasksRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final TasksRemoteDataSource _remoteDataSource;

  @override
  AsyncResult<List<EasyTaskModel>> getAllTasks({
    required GetTasksFiltersParams filtersParams,
  }) async {
    try {
      final tasks = await _remoteDataSource.getTasks(filters: filtersParams);
      return Result.ok(tasks.map((e) => e.toModel()).toList());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<EasyTaskModel> createTask({
    required CreateTaskParams params,
  }) async {
    try {
      final response = await _remoteDataSource.createTask(
        params: params.toQuery(),
      );
      return Result.ok(response.toModel());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> updateTask({required EditTaskParams params}) async {
    try {
      await _remoteDataSource.updateTask(params: params.toQuery());
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> deleteTask({required String id}) async {
    try {
      await _remoteDataSource.deleteTask(id: id);
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }
}
