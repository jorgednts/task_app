import 'package:core/core.dart';

import '../easy_task_category_model.dart';
import '../easy_task_media_item_model.dart';
import '../task_status.dart';

class EditTaskParams {
  EditTaskParams({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.category,
    required this.status,
    required this.newMedia,
    required this.currentMedia,
  });

  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final EasyTaskCategoryModel? category;
  final EasyTaskStatus status;
  final List<MediaFile> newMedia;
  final List<EasyTaskMediaItemModel> currentMedia;

  Map<String, dynamic> toQuery() {
    final result = {
      'id': id,
      'title': title,
      'description': description,
      'due_date': dueDate.toIso8601String(),
      'status': status.name,
    };
    if (category != null) {
      result['category_id'] = category!.id;
    }
    return result;
  }
}
