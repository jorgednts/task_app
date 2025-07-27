class RegisterUserParams {
  RegisterUserParams({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  Map<String, dynamic> toUserData() {
    return {
      'name': name,
    };
  }
}
