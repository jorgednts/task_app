import 'package:core/core.dart';

import '../../../domain/model/user/easy_task_user_model.dart';

enum AuthFormType { signIn, signUp }

sealed class AuthState {
  const AuthState(this.formType);

  final AuthFormType formType;
}

class AuthInitial extends AuthState {
  const AuthInitial({
    required AuthFormType formType,
  }) : super(formType);
}

class AuthLoading extends AuthState {
  const AuthLoading({
    required AuthFormType formType,
  }) : super(formType);
}

class AuthSuccess extends AuthState {
  const AuthSuccess({
    required this.user,
    required AuthFormType formType,
  }) : super(formType);

  final EasyTaskUserModel user;
}

class AuthNetworkError extends AuthState {
  const AuthNetworkError({required AuthFormType formType}) : super(formType);
}

class AuthGenericError extends AuthState {
  const AuthGenericError({required AuthFormType formType}) : super(formType);
}

class AuthApiError extends AuthState {
  const AuthApiError({
    required AuthFormType formType,
    required this.errorCode,
  }) : super(formType);

  final AuthApiErrorCode errorCode;
}
