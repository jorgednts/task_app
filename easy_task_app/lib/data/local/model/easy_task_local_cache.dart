import 'dart:convert';

import 'package:equatable/equatable.dart';

class EasyTaskUserCache extends Equatable {
  factory EasyTaskUserCache.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString);

    return EasyTaskUserCache(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  const EasyTaskUserCache({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  @override
  List<Object?> get props => [id, name, email];
}
