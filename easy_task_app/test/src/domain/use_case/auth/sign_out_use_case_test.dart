import 'package:core/core.dart';
import 'package:easy_task_app/domain/use_case/auth/sign_out_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_current_user_use_case_test.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignOutUseCase useCase;

  setUp(
    () {
      mockAuthRepository = MockAuthRepository();
      useCase = SignOutUseCase(
        authRepository: mockAuthRepository,
      );
    },
  );

  provideDummy<Result<void>>(const Result.ok(null));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockAuthRepository.signOut(),
    ).thenAnswer((_) async => const Result.ok(null));
    await useCase.call(NoParam());
    verify(
      mockAuthRepository.signOut(),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockAuthRepository.signOut(),
    ).thenAnswer((_) async => const Result.ok(null));
    final result = await useCase.call(NoParam());
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockAuthRepository.signOut(),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(NoParam());
    expect(result, isA<Error>());
  });
}
