import '../easy_task_category_model.dart';
import '../easy_task_media_item_model.dart';
import '../task_status.dart';

class CreateTaskParams {
  CreateTaskParams({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.category,
    required this.status,
    required this.media,
  });

  final String title;
  final String description;
  final DateTime dueDate;
  final EasyTaskCategoryModel? category;
  final EasyTaskStatus status;
  final List<EasyTaskMediaItemModel> media;

  Map<String, dynamic> toQuery() {
    //TODO: implement media upload
    final result = {
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
