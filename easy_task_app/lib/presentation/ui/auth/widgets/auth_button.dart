import 'package:design_system/design_system.dart';
import '../../../bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onSignIn,
    required this.onSignUp,
    required this.onToggleFormType,
    required this.onValidate,
    required this.state,
  });

  final void Function() onSignIn;
  final void Function() onSignUp;
  final void Function() onToggleFormType;
  final bool Function() onValidate;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    if (state is AuthLoading) {
      return const CircularProgressIndicator();
    }

    final strings = AppIntl.of(context);
    final filledButtonLabel = switch (state.formType) {
      AuthFormType.signIn => strings.auth_sign_in_label,
      AuthFormType.signUp => strings.auth_sign_up_label,
    };

    final textButtonLabel = switch (state.formType) {
      AuthFormType.signIn => strings.auth_sign_up_message,
      AuthFormType.signUp => strings.auth_sign_in_message,
    };

    return Column(
      spacing: Spacing.small,
      children: [
        FilledButton(
          onPressed: () {
            if (!onValidate()) {
              return;
            }
            switch (state.formType) {
              case AuthFormType.signIn:
                onSignIn();
                break;
              case AuthFormType.signUp:
                onSignUp();
                break;
            }
          },
          child: FittedBox(
            child: StyledText.b2(
              filledButtonLabel,
              fontColor: Theme.of(context).colorScheme.onPrimary,
              isBold: true,
            ),
          ),
        ),
        TextButton(
          onPressed: onToggleFormType,
          child: FittedBox(
            child: StyledText.l3(
              textButtonLabel,
              fontColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
