import 'package:core/core.dart';

import '../../model/user/register_user_params.dart';
import '../../model/user/easy_task_user_model.dart';
import '../../repository/auth_repository.dart';

class RegisterUserUseCase
    implements BaseUseCase<RegisterUserParams, EasyTaskUserModel> {
  RegisterUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  AsyncResult<EasyTaskUserModel> call(RegisterUserParams input) async {
    return await _authRepository.registerUser(registerRequest: input);
  }
}
