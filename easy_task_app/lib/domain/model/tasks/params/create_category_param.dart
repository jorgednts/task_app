import '../easy_task_category_color.dart';

class CreateCategoryParams {
  CreateCategoryParams({
    required this.name,
    required this.color,
  });

  final String name;
  final EasyTaskCategoryColorModel color;

  Map<String, dynamic> toQuery() {
    return {
      'name': name,
      'color': color.name,
    };
  }
}
