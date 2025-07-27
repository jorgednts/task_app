import 'package:core/core.dart';

import '../../model/user/easy_task_user_model.dart';
import '../../repository/auth_repository.dart';

class GetCurrentUserUseCase
    implements BaseUseCase<NoParam, EasyTaskUserModel?> {
  GetCurrentUserUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  AsyncResult<EasyTaskUserModel?> call(NoParam input) async {
    return await _authRepository.getCurrentUser();
  }
}
