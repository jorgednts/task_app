class EasyTaskCategoryResponse {
  factory EasyTaskCategoryResponse.fromJson(Map<String, dynamic> json) {
    return EasyTaskCategoryResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      userId: json['user_id'] as String,
    );
  }

  EasyTaskCategoryResponse({
    required this.id,
    required this.name,
    required this.color,
    required this.userId,
  });

  final String id;
  final String name;
  final String color;
  final String userId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'user_id': userId,
    };
  }
}
