import 'easy_task_category_response.dart';
import 'easy_task_media_item_response.dart';

class EasyTaskResponse {
  EasyTaskResponse({
    required this.id,
    required this.title,
    this.description,
    required this.dueDate,
    required this.status,
    required this.userId,
    required this.media,
    required this.category,
  });

  factory EasyTaskResponse.fromJson(Map<String, dynamic> json) {
    final mediaJson = json['media'];
    final mediaItems = <EasyTaskMediaItemResponse>[];

    if (mediaJson != null && mediaJson is List) {
      mediaItems.addAll(
        mediaJson.map(
          (e) => EasyTaskMediaItemResponse.fromJson(e as Map<String, dynamic>),
        ),
      );
    }

    return EasyTaskResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: DateTime.parse(json['due_date'] as String),
      status: json['status'] as String,
      userId: json['user_id'] as String,
      media: mediaItems,
      category: json['task_categories'] != null
          ? EasyTaskCategoryResponse.fromJson(json['task_categories'])
          : null,
    );
  }

  final String id;
  final String title;
  final String? description;
  final DateTime dueDate;
  final String status;
  final String userId;
  final List<EasyTaskMediaItemResponse> media;
  final EasyTaskCategoryResponse? category;

  Map<String, dynamic> toJson() {
    final result = {
      'title': title,
      'description': description,
      'due_date': dueDate.toIso8601String(),
      'status': status,
      'user_id': userId,
      'media': media.map((m) => m.toJson()).toList(),
    };
    if (category != null) {
      result['category_id'] = category!.id;
    }

    return result;
  }
}
