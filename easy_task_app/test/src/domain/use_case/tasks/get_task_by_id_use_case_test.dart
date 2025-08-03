import 'package:core/core.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_model.dart';
import 'package:easy_task_app/domain/use_case/tasks/get_task_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/task_test_resources.dart';
import 'create_task_use_case_test.mocks.dart';

void main() {
  late MockTasksRepository mockTasksRepository;
  late GetTaskByIdUseCase useCase;

  setUp(
    () {
      mockTasksRepository = MockTasksRepository();
      useCase = GetTaskByIdUseCase(
        tasksRepository: mockTasksRepository,
      );
    },
  );

  provideDummy<Result<EasyTaskModel>>(Result.ok(mockTasksModel));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockTasksRepository.getTaskById(id: 'id123'),
    ).thenAnswer((_) async => Result.ok(mockTasksModel));
    await useCase.call('id123');
    verify(
      mockTasksRepository.getTaskById(id: 'id123'),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockTasksRepository.getTaskById(id: 'id123'),
    ).thenAnswer((_) async => Result.ok(mockTasksModel));
    final result = await useCase.call('id123');
    expect(result, isA<Result<EasyTaskModel>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockTasksRepository.getTaskById(id: 'id123'),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call('id123');
    expect(result, isA<Error>());
  });
}
