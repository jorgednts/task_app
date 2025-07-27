import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EasyTaskUserResponse extends Equatable {
  factory EasyTaskUserResponse.fromUser(User user) {
    return EasyTaskUserResponse(
      id: user.id,
      email: user.email,
      name: user.userMetadata?['name'],
      createdAt: DateTime.tryParse(user.createdAt),
    );
  }

  const EasyTaskUserResponse({
    required this.id,
    required this.email,
    required this.name,
    this.createdAt,
  });

  final String? id;
  final String? email;
  final String? name;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, email, name, createdAt];
}
