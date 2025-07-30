import '../easy_task_category_color.dart';

class EditCategoryParams {
  EditCategoryParams({
    required this.id,
    required this.name,
    required this.color,
    required this.userId,
  });

  final String id;
  final String name;
  final EasyTaskCategoryColorModel color;
  final String userId;

  Map<String, dynamic> toQuery() {
    return {
      'name': name,
      'color': color.name,
      'user_id': userId,
      'id': id,
    };
  }
}
