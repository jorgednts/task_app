import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/easy_task_user_response.dart';
import '../../model/register_user_params.dart';
import '../../model/sign_in_params.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required SupabaseClient supabaseClient,
    required LoggerService logger,
  }) : _supabaseClient = supabaseClient,
       _logger = logger;

  final SupabaseClient _supabaseClient;
  final LoggerService _logger;

  @override
  Future<EasyTaskUserResponse> registerUser({
    required RegisterUserParams registerRequest,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: registerRequest.email,
        password: registerRequest.password,
        data: registerRequest.toUserData(),
      );

      if (response.user == null) {
        final message = 'No User Found';
        _logger.e(message);
        throw NullUserException(message: message);
      }

      _logger.d('User registered successfully');
      return EasyTaskUserResponse.fromUser(response.user!);
    } on AuthException catch (e) {
      _logger.e(e.message);
      throw CustomAuthException(
        message: e.message,
        code: AuthApiErrorCode.fromCode(e.code),
      );
    } catch (e) {
      _logger.e(e.toString());
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<EasyTaskUserResponse?> getCurrentUser() async {
    try {
      final session = _supabaseClient.auth.currentSession;

      if (session == null) {
        _logger.d('No session found');
        return null;
      }

      final user = session.user;
      _logger.d('User found: ${user.email}');
      return EasyTaskUserResponse.fromUser(user);
    } on AuthException catch (e) {
      _logger.e(e.toString());
      throw CustomAuthException(
        message: e.message,
        code: AuthApiErrorCode.fromCode(e.code),
      );
    } catch (e) {
      _logger.e(e.toString());
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<EasyTaskUserResponse> signInUser({
    required SignInParams signInParams,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: signInParams.email,
        password: signInParams.password,
      );

      if (response.user == null) {
        final message = 'No User Found';
        _logger.e(message);
        throw NullUserException(message: message);
      }

      return EasyTaskUserResponse.fromUser(response.user!);
    } on AuthException catch (e) {
      _logger.e(e.toString());
      throw CustomAuthException(
        message: e.message,
        code: AuthApiErrorCode.fromCode(e.code),
      );
    } catch (e) {
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
      _logger.d('User signed out successfully');
    } on AuthException catch (e) {
      _logger.e(e.toString());
      throw CustomAuthException(
        message: e.message,
        code: AuthApiErrorCode.fromCode(e.code),
      );
    } catch (e) {
      _logger.e(e.toString());
      throw GenericException(message: e.toString());
    }
  }

  @override
  Stream<AuthState> get authStateChanges =>
      _supabaseClient.auth.onAuthStateChange;
}
