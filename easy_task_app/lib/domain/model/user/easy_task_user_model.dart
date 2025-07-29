class EasyTaskUserModel {
  EasyTaskUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory EasyTaskUserModel.fromQuery(Map<String, dynamic> query) {
    return EasyTaskUserModel(
      id: query['id'],
      name: query['name'],
      email: query['email'],
    );
  }

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toQuery() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
