import 'package:equatable/equatable.dart';

import 'easy_task_category_color.dart';

class EasyTaskCategoryModel extends Equatable {
  EasyTaskCategoryModel({
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
      'id': id,
      'name': name,
      'color': color.name,
      'user_id': userId,
    };
  }

  @override
  List<Object?> get props => [id, name, color, userId];
}
