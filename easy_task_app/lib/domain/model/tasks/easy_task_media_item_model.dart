import 'package:equatable/equatable.dart';

class EasyTaskMediaItemModel extends Equatable {
  const EasyTaskMediaItemModel({
    required this.type,
    required this.url,
  });

  factory EasyTaskMediaItemModel.fromQuery(Map<String, dynamic> query) {
    return EasyTaskMediaItemModel(
      type: query['type'],
      url: query['url'],
    );
  }

  final String type;
  final String url;

  bool get isImage => type.contains('image');

  String get fileName => url.split('/').last;

  Map<String, dynamic> toQuery() {
    return {
      'type': type,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [type, url];
}
