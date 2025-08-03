import 'package:core/core.dart';
import 'package:easy_task_app/domain/use_case/tasks/delete_media_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/task_test_resources.dart';
import 'create_task_use_case_test.mocks.dart';

void main() {
  late MockTasksRepository mockTasksRepository;
  late DeleteMediaUseCase useCase;

  setUp(
    () {
      mockTasksRepository = MockTasksRepository();
      useCase = DeleteMediaUseCase(
        tasksRepository: mockTasksRepository,
      );
    },
  );

  provideDummy<Result<void>>(const Result.ok(null));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockTasksRepository.deleteMediaFile(
        params: anyNamed('params'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));
    await useCase.call(deleteTaskParams);
    verify(
      mockTasksRepository.deleteMediaFile(params: deleteTaskParams),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockTasksRepository.deleteMediaFile(
        params: anyNamed('params'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));
    final result = await useCase.call(deleteTaskParams);
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockTasksRepository.deleteMediaFile(
        params: anyNamed('params'),
      ),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(deleteTaskParams);
    expect(result, isA<Error>());
  });
}
