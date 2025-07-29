import 'easy_task_category_model.dart';
import 'easy_task_media_item_model.dart';
import 'task_status.dart';

class EasyTaskModel {
  EasyTaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.category,
    required this.status,
    required this.media,
  });

  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final EasyTaskCategoryModel? category;
  final EasyTaskStatus status;
  final List<EasyTaskMediaItemModel> media;
}
