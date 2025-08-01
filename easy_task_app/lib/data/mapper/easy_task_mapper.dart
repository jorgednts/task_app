import '../../domain/model/tasks/easy_task_category_color.dart';
import '../../domain/model/tasks/easy_task_category_model.dart';
import '../../domain/model/tasks/easy_task_media_item_model.dart';
import '../../domain/model/tasks/easy_task_model.dart';
import '../../domain/model/tasks/task_status.dart';
import '../../domain/model/user/easy_task_user_model.dart';
import '../remote/model/task/easy_task_category_response.dart';
import '../remote/model/task/easy_task_media_item_response.dart';
import '../remote/model/task/easy_task_response.dart';
import '../remote/model/user/easy_task_user_response.dart';
import 'empty_constants.dart';

extension EasyTaskUserResponseMapper on EasyTaskUserResponse {
  EasyTaskUserModel toModel() {
    return EasyTaskUserModel(
      name: name ?? EmptyConstants.emptyString,
      email: email ?? EmptyConstants.emptyString,
      id: id ?? EmptyConstants.emptyString,
    );
  }
}

extension EasyTaskCategoryResponseMapper on EasyTaskCategoryResponse {
  EasyTaskCategoryModel toModel() {
    return EasyTaskCategoryModel(
      id: id,
      name: name,
      color: EasyTaskCategoryColorModel.fromName(color),
      userId: userId,
    );
  }
}

extension EasyTaskMediaResponseMapper on EasyTaskMediaItemResponse {
  EasyTaskMediaItemModel toModel() {
    return EasyTaskMediaItemModel(
      type: type,
      url: url,
    );
  }
}

extension EasyTaskResponseMapper on EasyTaskResponse {
  EasyTaskModel toModel() {
    return EasyTaskModel(
      id: id,
      title: title,
      description: description ?? EmptyConstants.emptyString,
      dueDate: dueDate,
      category: category?.toModel(),
      status: EasyTaskStatus.valueOf(status),
      media: media.map((e) => e.toModel()).toList(),
    );
  }
}
