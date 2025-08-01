import 'package:core/core.dart';

import '../easy_task_category_model.dart';
import '../easy_task_media_item_model.dart';
import '../task_status.dart';
import 'create_task_params.dart';
import 'edit_task_params.dart';

class UploadMediaParams {
  UploadMediaParams({
    required this.taskId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.category,
    required this.status,
    required this.newMedia,
    required this.currentMedia,
  });

  factory UploadMediaParams.fromCreate(
    CreateTaskParams createParams,
    String taskId,
  ) {
    return UploadMediaParams(
      taskId: taskId,
      title: createParams.title,
      description: createParams.description,
      dueDate: createParams.dueDate,
      category: createParams.category,
      status: createParams.status,
      newMedia: createParams.newMedia,
      currentMedia: createParams.currentMedia,
    );
  }

  factory UploadMediaParams.fromEdit(EditTaskParams editParams) {
    return UploadMediaParams(
      taskId: editParams.id,
      title: editParams.title,
      description: editParams.description,
      dueDate: editParams.dueDate,
      category: editParams.category,
      status: editParams.status,
      newMedia: editParams.newMedia,
      currentMedia: editParams.currentMedia,
    );
  }

  final String taskId;
  final String title;
  final String description;
  final DateTime dueDate;
  final EasyTaskCategoryModel? category;
  final EasyTaskStatus status;
  final List<MediaFile> newMedia;
  final List<EasyTaskMediaItemModel> currentMedia;
}
