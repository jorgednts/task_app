class EasyTaskMediaItemResponse {
  EasyTaskMediaItemResponse({
    required this.type,
    required this.url,
  });

  factory EasyTaskMediaItemResponse.fromJson(Map<String, dynamic> json) {
    return EasyTaskMediaItemResponse(
      type: json['type'] as String,
      url: json['url'] as String,
    );
  }

  final String type;
  final String url;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }
}
