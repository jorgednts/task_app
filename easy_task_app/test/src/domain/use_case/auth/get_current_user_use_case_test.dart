import 'package:core/core.dart';
import 'package:easy_task_app/domain/model/user/easy_task_user_model.dart';
import 'package:easy_task_app/domain/repository/auth_repository.dart';
import 'package:easy_task_app/domain/use_case/auth/get_current_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/auth_test_resources.dart';
import 'get_current_user_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late GetCurrentUserUseCase useCase;

  setUp(
    () {
      mockAuthRepository = MockAuthRepository();
      useCase = GetCurrentUserUseCase(
        authRepository: mockAuthRepository,
      );
    },
  );

  provideDummy<Result<EasyTaskUserModel?>>(Result.ok(mockUserModel));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockAuthRepository.getCurrentUser(),
    ).thenAnswer((_) async => Result.ok(mockUserModel));
    await useCase.call(NoParam());
    verify(
      mockAuthRepository.getCurrentUser(),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockAuthRepository.getCurrentUser(),
    ).thenAnswer((_) async => Result.ok(mockUserModel));
    final result = await useCase.call(NoParam());
    expect(result, isA<Result<EasyTaskUserModel?>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockAuthRepository.getCurrentUser(),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(NoParam());
    expect(result, isA<Error>());
  });
}
