import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/user/easy_task_user_response.dart';
import '../../../../domain/model/user/register_user_params.dart';
import '../../model/user/sign_in_params.dart';

abstract class AuthRemoteDataSource {
  Future<EasyTaskUserResponse> registerUser({
    required RegisterUserParams registerRequest,
  });

  Future<EasyTaskUserResponse?> getCurrentUser();

  Future<void> signOut();

  Stream<AuthState> get authStateChanges;

  Future<EasyTaskUserResponse> signInUser({
    required SignInParams signInParams,
  });
}
