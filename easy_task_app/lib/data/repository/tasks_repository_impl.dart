import 'package:core/core.dart';

import '../../domain/model/tasks/easy_task_model.dart';
import '../../domain/model/tasks/params/create_task_params.dart';
import '../../domain/model/tasks/params/delete_media_params.dart';
import '../../domain/model/tasks/params/edit_task_params.dart';
import '../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../domain/model/tasks/params/upload_media_params.dart';
import '../../domain/repository/tasks_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/tasks/media_remote_data_source.dart';
import '../remote/data_source/tasks/tasks_remote_data_source.dart';
import '../remote/model/task/easy_task_media_item_response.dart';
import '../remote/model/task/easy_task_response.dart';

class TasksRepositoryImpl extends BaseRepository implements TasksRepository {
  TasksRepositoryImpl({
    required TasksRemoteDataSource taskRemoteDataSource,
    required MediaRemoteDataSource mediaRemoteDataSource,
    required super.networkService,
  }) : _remoteDataSource = taskRemoteDataSource,
       _mediaRemoteDataSource = mediaRemoteDataSource;
  final TasksRemoteDataSource _remoteDataSource;
  final MediaRemoteDataSource _mediaRemoteDataSource;

  @override
  AsyncResult<List<EasyTaskModel>> getAllTasks({
    required GetTasksFiltersParams filtersParams,
  }) async {
    try {
      final tasks =
          await checkInternetConnectionAndExecute<
            GetTasksFiltersParams,
            List<EasyTaskResponse>
          >(
            input: filtersParams,
            execute: (input) => _remoteDataSource.getTasks(filters: input),
          );
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
      final response =
          await checkInternetConnectionAndExecute<
            CreateTaskParams,
            EasyTaskResponse
          >(
            input: params,
            execute: (input) => _remoteDataSource.createTask(
              params: input.toQuery(),
            ),
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
      await checkInternetConnectionAndExecute<EditTaskParams, void>(
        input: params,
        execute: (input) =>
            _remoteDataSource.updateTask(params: input.toQuery()),
      );
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
      await checkInternetConnectionAndExecute<String, void>(
        input: id,
        execute: (input) => _remoteDataSource.deleteTask(id: input),
      );
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<List<EasyTaskMediaItemResponse>> uploadMediaFiles({
    required UploadMediaParams params,
  }) async {
    try {
      final response =
          await checkInternetConnectionAndExecute<
            UploadMediaParams,
            List<EasyTaskMediaItemResponse>
          >(
            input: params,
            execute: (input) =>
                _mediaRemoteDataSource.uploadMediaFiles(params: input),
          );
      return Result.ok(response);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> deleteMediaFile({required DeleteMediaParams params}) async {
    try {
      await checkInternetConnectionAndExecute<DeleteMediaParams, void>(
        input: params,
        execute: (input) =>
            _mediaRemoteDataSource.deleteMediaFile(params: input),
      );
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<EasyTaskModel> getTaskById({required String id}) async {
    try {
      final response =
          await checkInternetConnectionAndExecute<String, EasyTaskResponse>(
            input: id,
            execute: (input) => _remoteDataSource.getTaskById(taskId: input),
          );
      return Result.ok(response.toModel());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }
}
