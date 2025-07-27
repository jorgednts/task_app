import '../../domain/model/user/easy_task_user_model.dart';
import '../local/model/easy_task_local_cache.dart';
import '../remote/model/easy_task_user_response.dart';
import 'empty_constants.dart';

extension EasyTaskUserResponseMapper on EasyTaskUserResponse {
  EasyTaskUserModel toModel() {
    return EasyTaskUserModel(
      name: name ?? EmptyConstants.emptyString,
      email: email ?? EmptyConstants.emptyString,
    );
  }
}

extension EasyTaskUserCacheMapper on EasyTaskUserCache {
  EasyTaskUserModel toModel() {
    return EasyTaskUserModel(
      name: name,
      email: email,
    );
  }
}
