import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/model/user/register_user_params.dart';
import '../../../data/remote/model/user/sign_in_params.dart';
import '../../../domain/use_case/auth/get_current_user_use_case.dart';
import '../../../domain/use_case/auth/register_user_use_case.dart';
import '../../../domain/use_case/auth/sign_in_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterUserUseCase registerUserUseCase,
    required SignInUseCase signInUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  }) : _registerUserUseCase = registerUserUseCase,
       _signInUseCase = signInUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       super(const AuthInitial(formType: AuthFormType.signIn)) {
    _onInit();
  }

  final RegisterUserUseCase _registerUserUseCase;
  final SignInUseCase _signInUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  void _onInit() {
    on<SignUp>(_onSignUp);
    on<SignIn>(_onSignIn);
    on<ToggleFormType>(_onToggleFormType);
    on<AuthGetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onGetCurrentUser(
    AuthGetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(formType: state.formType));
    (await _getCurrentUserUseCase.call(
      NoParam(),
    )).fold(
      onOk: (result) {
        if (result != null) {
          emit(
            AuthSuccess(
              user: result,
              formType: state.formType,
            ),
          );
        } else {
          emit(const AuthInitial(formType: AuthFormType.signIn));
        }
      },
      onError: (error) {
        emit(const AuthInitial(formType: AuthFormType.signIn));
      },
    );
  }

  void _onToggleFormType(ToggleFormType event, Emitter<AuthState> emit) {
    final newFormType = state.formType == AuthFormType.signIn
        ? AuthFormType.signUp
        : AuthFormType.signIn;
    emit(AuthInitial(formType: newFormType));
  }

  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading(formType: state.formType));
    (await _registerUserUseCase(
      RegisterUserParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    )).fold(
      onOk: (result) {
        emit(
          AuthSuccess(
            user: result,
            formType: state.formType,
          ),
        );
      },
      onError: (error) {
        emit(_getAuthState(error));
      },
    );
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading(formType: state.formType));
    (await _signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    )).fold(
      onOk: (result) {
        emit(
          AuthSuccess(
            user: result,
            formType: state.formType,
          ),
        );
      },
      onError: (error) {
        emit(_getAuthState(error));
      },
    );
  }

  AuthState _getAuthState(CustomException exception) {
    switch (exception) {
      case NullUserException():
      case GenericException():
      case CacheException():
        return AuthGenericError(formType: state.formType);
      case NetworkException():
        return AuthNetworkError(formType: state.formType);
      case CustomAuthException():
        return AuthApiError(
          formType: state.formType,
          errorCode: exception.code,
        );
    }
  }
}
