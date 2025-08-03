import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user/register_user_params.dart';
import '../../data/remote/model/user/sign_in_params.dart';
import '../model/user/easy_task_user_model.dart';

abstract class AuthRepository {
  AsyncResult<EasyTaskUserModel> registerUser({
    required RegisterUserParams registerParams,
  });

  AsyncResult<EasyTaskUserModel?> getCurrentUser();

  AsyncResult<EasyTaskUserModel> signInUser({
    required SignInParams signInParams,
  });

  AsyncResult<void> signOut();

  Stream<AuthState> get authStateChanges;
}
