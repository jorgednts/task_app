import 'package:core/core.dart';

import '../../../data/remote/model/user/sign_in_params.dart';
import '../../model/user/easy_task_user_model.dart';
import '../../repository/auth_repository.dart';

class SignInUseCase implements BaseUseCase<SignInParams, EasyTaskUserModel> {
  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  AsyncResult<EasyTaskUserModel> call(SignInParams input) async {
    return await _authRepository.signInUser(signInParams: input);
  }
}
