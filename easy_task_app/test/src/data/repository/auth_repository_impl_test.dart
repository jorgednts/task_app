import 'package:core/core.dart';
import 'package:easy_task_app/data/remote/data_source/auth/auth_remote_data_source.dart';
import 'package:easy_task_app/data/repository/auth_repository_impl.dart';
import 'package:easy_task_app/domain/model/user/easy_task_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/auth_test_resources.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, NetworkService])
void main() {
  late MockAuthRemoteDataSource mockDataSource;
  late MockNetworkService mockNetworkService;
  late AuthRepositoryImpl repository;

  provideDummy<Result<EasyTaskUserModel>>(Result.ok(mockUserModel));
  provideDummy<Result<EasyTaskUserModel?>>(const Result.ok(null));
  provideDummy<Result<void>>(const Result.ok(null));

  setUp(() {
    mockDataSource = MockAuthRemoteDataSource();
    mockNetworkService = MockNetworkService();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkService: mockNetworkService,
    );
    when(
      mockNetworkService.checkInternetConnection(),
    ).thenAnswer((_) async => true);
  });

  group('registerUser', () {
    test('GIVEN a call '
        'WHEN registerUser is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.registerUser(
          registerParams: registerParams,
        ),
      ).thenAnswer((_) async => mockUserResponse);

      await repository.registerUser(registerParams: registerParams);
      verify(
        mockDataSource.registerUser(registerParams: registerParams),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN registerUser is called '
        'THEN it should return EasyTaskUserModel', () async {
      when(
        mockDataSource.registerUser(
          registerParams: registerParams,
        ),
      ).thenAnswer((_) async => mockUserResponse);

      final result = await repository.registerUser(
        registerParams: registerParams,
      );
      expect(result, isA<Ok<EasyTaskUserModel>>());
    });

    test('GIVEN a failure '
        'WHEN registerUser is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.registerUser(
          registerParams: registerParams,
        ),
      ).thenThrow(Exception('Registration failed'));

      final result = await repository.registerUser(
        registerParams: registerParams,
      );
      expect(result, isA<Error>());
    });
  });

  group('getCurrentUser', () {
    test('GIVEN a call '
        'WHEN getCurrentUser is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.getCurrentUser(),
      ).thenAnswer((_) async => mockUserResponse);

      await repository.getCurrentUser();
      verify(mockDataSource.getCurrentUser()).called(1);
    });

    test('GIVEN a successful response '
        'WHEN getCurrentUser is called '
        'THEN it should return EasyTaskUserModel', () async {
      when(
        mockDataSource.getCurrentUser(),
      ).thenAnswer((_) async => mockUserResponse);

      final result = await repository.getCurrentUser();
      expect(result, isA<Ok<EasyTaskUserModel?>>());
    });

    test('GIVEN a successful response with null '
        'WHEN getCurrentUser is called '
        'THEN it should return null', () async {
      when(mockDataSource.getCurrentUser()).thenAnswer((_) async => null);

      final result = await repository.getCurrentUser();
      expect(result, isA<Ok<EasyTaskUserModel?>>());
    });
  });

  group('signInUser', () {
    test('GIVEN a call '
        'WHEN signInUser is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.signInUser(signInParams: signInParams),
      ).thenAnswer((_) async => mockUserResponse);

      await repository.signInUser(signInParams: signInParams);
      verify(mockDataSource.signInUser(signInParams: signInParams)).called(1);
    });

    test('GIVEN a successful response '
        'WHEN signInUser is called '
        'THEN it should return EasyTaskUserModel', () async {
      when(
        mockDataSource.signInUser(signInParams: signInParams),
      ).thenAnswer((_) async => mockUserResponse);

      final result = await repository.signInUser(signInParams: signInParams);
      expect(result, isA<Ok<EasyTaskUserModel>>());
    });

    test('GIVEN a failure '
        'WHEN signInUser is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.signInUser(signInParams: signInParams),
      ).thenThrow(Exception('Sign in failed'));

      final result = await repository.signInUser(signInParams: signInParams);
      expect(result, isA<Error>());
    });
  });

  group('signOut', () {
    test('GIVEN a call '
        'WHEN signOut is called '
        'THEN it should call the data source once', () async {
      when(mockDataSource.signOut()).thenAnswer((_) async {});

      await repository.signOut();
      verify(mockDataSource.signOut()).called(1);
    });

    test('GIVEN a successful response '
        'WHEN signOut is called '
        'THEN it should return success', () async {
      when(mockDataSource.signOut()).thenAnswer((_) async {});

      final result = await repository.signOut();
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN signOut is called '
        'THEN it should return an error', () async {
      when(mockDataSource.signOut()).thenThrow(Exception('Sign out failed'));

      final result = await repository.signOut();
      expect(result, isA<Error>());
    });
  });
}
