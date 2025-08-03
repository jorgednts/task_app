import 'package:core/core.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_model.dart';
import 'package:easy_task_app/domain/repository/tasks_repository.dart';
import 'package:easy_task_app/domain/use_case/tasks/create_task_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/task_test_resources.dart';
import 'create_task_use_case_test.mocks.dart';

@GenerateMocks([TasksRepository])
void main() {
  late MockTasksRepository mockTasksRepository;
  late CreateTaskUseCase useCase;

  setUp(
    () {
      mockTasksRepository = MockTasksRepository();
      useCase = CreateTaskUseCase(
        tasksRepository: mockTasksRepository,
      );
    },
  );

  provideDummy<Result<EasyTaskModel>>(Result.ok(mockTasksModel));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockTasksRepository.createTask(params: createTaskParams),
    ).thenAnswer((_) async => Result.ok(mockTasksModel));
    await useCase.call(createTaskParams);
    verify(
      mockTasksRepository.createTask(params: createTaskParams),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockTasksRepository.createTask(params: anyNamed('params')),
    ).thenAnswer((_) async => Result.ok(mockTasksModel));
    final result = await useCase.call(createTaskParams);
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockTasksRepository.createTask(params: anyNamed('params')),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(createTaskParams);
    expect(result, isA<Error>());
  });
}
