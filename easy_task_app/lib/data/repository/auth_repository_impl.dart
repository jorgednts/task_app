import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/model/user/easy_task_user_model.dart';
import '../../domain/model/user/register_user_params.dart';
import '../../domain/repository/auth_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/auth/auth_remote_data_source.dart';
import '../remote/model/user/easy_task_user_response.dart';
import '../remote/model/user/sign_in_params.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required super.networkService,
  }) : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

  @override
  AsyncResult<EasyTaskUserModel> registerUser({
    required RegisterUserParams registerParams,
  }) async {
    try {
      final user =
          await checkInternetConnectionAndExecute<
            RegisterUserParams,
            EasyTaskUserResponse
          >(
            input: registerParams,
            execute: (input) =>
                _remoteDataSource.registerUser(registerParams: input),
          );
      return Result.ok(user.toModel());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<EasyTaskUserModel?> getCurrentUser() async {
    try {
      final user =
          await checkInternetConnectionAndExecute<void, EasyTaskUserResponse?>(
            input: null,
            execute: (input) => _remoteDataSource.getCurrentUser(),
          );
      return Result.ok(user?.toModel());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<EasyTaskUserModel> signInUser({
    required SignInParams signInParams,
  }) async {
    try {
      final user =
          await checkInternetConnectionAndExecute<
            SignInParams,
            EasyTaskUserResponse
          >(
            input: signInParams,
            execute: (signInParams) => _remoteDataSource.signInUser(
              signInParams: signInParams,
            ),
          );
      return Result.ok(user.toModel());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> signOut() async {
    try {
      await checkInternetConnectionAndExecute<void, void>(
        input: null,
        execute: (input) => _remoteDataSource.signOut(),
      );
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  Stream<AuthState> get authStateChanges => _remoteDataSource.authStateChanges;
}
