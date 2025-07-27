sealed class AuthEvent {
  const AuthEvent();
}

class ToggleFormType extends AuthEvent {
  const ToggleFormType();
}

class SignIn extends AuthEvent {
  const SignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignUp extends AuthEvent {
  const SignUp({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;
}

class GetCurrentUser extends AuthEvent {
  const GetCurrentUser();
}
