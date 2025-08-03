import 'package:core/core.dart';
import 'package:easy_task_app/data/remote/data_source/tasks/media_remote_data_source.dart';
import 'package:easy_task_app/data/remote/data_source/tasks/tasks_remote_data_source.dart';
import 'package:easy_task_app/data/remote/model/task/easy_task_media_item_response.dart';
import 'package:easy_task_app/data/repository/tasks_repository_impl.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/task_test_resources.dart';
import 'tasks_repository_impl_test.mocks.dart';

@GenerateMocks([TasksRemoteDataSource, MediaRemoteDataSource, NetworkService])
void main() {
  late MockTasksRemoteDataSource mockTasksDataSource;
  late MockMediaRemoteDataSource mockMediaDataSource;
  late MockNetworkService mockNetworkService;
  late TasksRepositoryImpl repository;

  provideDummy<Result<List<EasyTaskModel>>>(
    const Result.ok(<EasyTaskModel>[]),
  );
  provideDummy<Result<EasyTaskModel>>(
    Result.ok(mockTasksModel),
  );
  provideDummy<Result<List<EasyTaskMediaItemResponse>>>(
    const Result.ok(<EasyTaskMediaItemResponse>[]),
  );
  provideDummy<Result<void>>(const Result.ok(null));

  setUp(() {
    mockTasksDataSource = MockTasksRemoteDataSource();
    mockMediaDataSource = MockMediaRemoteDataSource();
    mockNetworkService = MockNetworkService();
    repository = TasksRepositoryImpl(
      taskRemoteDataSource: mockTasksDataSource,
      mediaRemoteDataSource: mockMediaDataSource,
      networkService: mockNetworkService,
    );
    when(
      mockNetworkService.checkInternetConnection(),
    ).thenAnswer((_) async => true);
  });

  group('getAllTasks', () {
    test('GIVEN a call '
        'WHEN getAllTasks is called '
        'THEN it should call the data source once', () async {
      when(
        mockTasksDataSource.getTasks(filters: anyNamed('filters')),
      ).thenAnswer((_) async => mockTasksResponse);

      await repository.getAllTasks(filtersParams: filtersParams);
      verify(mockTasksDataSource.getTasks(filters: filtersParams)).called(1);
    });

    test('GIVEN a successful response '
        'WHEN getAllTasks is called '
        'THEN it should return list of EasyTaskModel', () async {
      when(
        mockTasksDataSource.getTasks(filters: filtersParams),
      ).thenAnswer((_) async => mockTasksResponse);

      final result = await repository.getAllTasks(filtersParams: filtersParams);
      expect(result, isA<Ok<List<EasyTaskModel>>>());

      result.fold(
        onOk: (tasks) {
          expect(tasks.length, 2);
        },
        onError: (_) => fail('Should not return error'),
      );
    });

    test('GIVEN a failure '
        'WHEN getAllTasks is called '
        'THEN it should return an error', () async {
      when(
        mockTasksDataSource.getTasks(filters: anyNamed('filters')),
      ).thenThrow(Exception('Get tasks failed'));

      final result = await repository.getAllTasks(filtersParams: filtersParams);
      expect(result, isA<Error>());
    });
  });

  group('createTask', () {
    test('GIVEN a call '
        'WHEN createTask is called '
        'THEN it should call the data source once', () async {
      when(
        mockTasksDataSource.createTask(params: anyNamed('params')),
      ).thenAnswer((_) async => mockTaskResponse);

      await repository.createTask(params: createTaskParams);
      verify(
        mockTasksDataSource.createTask(params: createTaskParams.toQuery()),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN createTask is called '
        'THEN it should return EasyTaskModel', () async {
      when(
        mockTasksDataSource.createTask(params: anyNamed('params')),
      ).thenAnswer((_) async => mockTaskResponse);

      final result = await repository.createTask(params: createTaskParams);
      expect(result, isA<Ok<EasyTaskModel>>());
    });

    test('GIVEN a failure '
        'WHEN createTask is called '
        'THEN it should return an error', () async {
      when(
        mockTasksDataSource.createTask(params: anyNamed('params')),
      ).thenThrow(Exception('Create task failed'));

      final result = await repository.createTask(params: createTaskParams);
      expect(result, isA<Error>());
    });
  });

  group('updateTask', () {
    test('GIVEN a call '
        'WHEN updateTask is called '
        'THEN it should call the data source once', () async {
      when(
        mockTasksDataSource.updateTask(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      await repository.updateTask(params: editTaskParams);
      verify(
        mockTasksDataSource.updateTask(params: editTaskParams.toQuery()),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN updateTask is called '
        'THEN it should return success', () async {
      when(
        mockTasksDataSource.updateTask(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      final result = await repository.updateTask(params: editTaskParams);
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN updateTask is called '
        'THEN it should return an error', () async {
      when(
        mockTasksDataSource.updateTask(params: anyNamed('params')),
      ).thenThrow(Exception('Update task failed'));

      final result = await repository.updateTask(params: editTaskParams);
      expect(result, isA<Error>());
    });
  });

  group('deleteTask', () {
    test('GIVEN a call '
        'WHEN deleteTask is called '
        'THEN it should call the data source once', () async {
      when(
        mockTasksDataSource.deleteTask(id: anyNamed('id')),
      ).thenAnswer((_) async {});

      await repository.deleteTask(id: taskId);
      verify(mockTasksDataSource.deleteTask(id: taskId)).called(1);
    });

    test('GIVEN a successful response '
        'WHEN deleteTask is called '
        'THEN it should return success', () async {
      when(
        mockTasksDataSource.deleteTask(id: anyNamed('id')),
      ).thenAnswer((_) async {
        return;
      });

      final result = await repository.deleteTask(id: taskId);
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN deleteTask is called '
        'THEN it should return an error', () async {
      when(
        mockTasksDataSource.deleteTask(id: anyNamed('id')),
      ).thenThrow(Exception('Delete task failed'));

      final result = await repository.deleteTask(id: taskId);
      expect(result, isA<Error>());
    });
  });
}
