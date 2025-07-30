import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/model/user/easy_task_user_model.dart';
import '../../domain/repository/auth_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/auth/auth_remote_data_source.dart';
import '../../domain/model/user/register_user_params.dart';
import '../remote/model/user/sign_in_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

  @override
  AsyncResult<EasyTaskUserModel> registerUser({
    required RegisterUserParams registerRequest,
  }) async {
    try {
      final user = await _remoteDataSource.registerUser(
        registerRequest: registerRequest,
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
      final user = await _remoteDataSource.getCurrentUser();
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
      final user = await _remoteDataSource.signInUser(
        signInParams: signInParams,
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
      await _remoteDataSource.signOut();
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
