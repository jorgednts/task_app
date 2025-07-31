import 'dart:convert';

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

  factory EasyTaskModel.fromQuery(Map<String, dynamic> query) {
    return EasyTaskModel(
      id: query['id'],
      title: query['title'],
      description: query['description'],
      dueDate: DateTime.parse(query['due_date']),
      category: query['category'] != null && query['category'].toString().isNotEmpty
          ? EasyTaskCategoryModel.fromQuery(
        jsonDecode(query['category']) as Map<String, dynamic>,
      )
          : null,
      status: EasyTaskStatus.values.firstWhere(
            (status) => status.name == query['status'],
      ),
      media: [],
    );
  }

  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final EasyTaskCategoryModel? category;
  final EasyTaskStatus status;
  final List<EasyTaskMediaItemModel> media;

  Map<String, dynamic> toQuery() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'due_date': dueDate.toIso8601String(),
      'category': category != null ? jsonEncode(category!.toQuery()) : null,
      'status': status.name,
    };
  }
}
