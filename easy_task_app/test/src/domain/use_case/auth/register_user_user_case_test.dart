import 'package:core/core.dart';
import 'package:easy_task_app/domain/model/user/easy_task_user_model.dart';
import 'package:easy_task_app/domain/use_case/auth/register_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/auth_test_resources.dart';
import 'get_current_user_use_case_test.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUserUseCase useCase;

  setUp(
    () {
      mockAuthRepository = MockAuthRepository();
      useCase = RegisterUserUseCase(
        authRepository: mockAuthRepository,
      );
    },
  );

  provideDummy<Result<EasyTaskUserModel>>(Result.ok(mockUserModel));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockAuthRepository.registerUser(registerParams: registerParams),
    ).thenAnswer((_) async => Result.ok(mockUserModel));
    await useCase.call(registerParams);
    verify(
      mockAuthRepository.registerUser(registerParams: registerParams),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockAuthRepository.registerUser(registerParams: registerParams),
    ).thenAnswer((_) async => Result.ok(mockUserModel));
    final result = await useCase.call(registerParams);
    expect(result, isA<Result<EasyTaskUserModel>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockAuthRepository.registerUser(registerParams: registerParams),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(registerParams);
    expect(result, isA<Error>());
  });
}
