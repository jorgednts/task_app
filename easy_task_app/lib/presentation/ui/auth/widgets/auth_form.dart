import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../data/mapper/empty_constants.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../utils/form_field_validators.dart';
import 'auth_button.dart';
import 'auth_title_message.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late TextEditingController emailController, passwordController;
  TextEditingController? nameController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return Center(
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: WidthResponsiveBreakpoints.small,
          ),
          padding: const EdgeInsets.all(Spacing.medium),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final bloc = context.read<AuthBloc>();
              if (state.formType == AuthFormType.signUp) {
                nameController = TextEditingController();
              } else if (nameController != null) {
                nameController = null;
              }
              return Column(
                spacing: Spacing.medium,
                mainAxisAlignment: MainAxisAlignment.center,
                children: (state is AuthLoading)
                    ? [
                        StyledText.l3(strings.auth_verifying_user_message),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ]
                    : [
                        const AuthTitleMessage(),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: Spacing.medium,
                            children: <Widget>[
                              if (state.formType == AuthFormType.signUp) ...[
                                CustomTextFormField(
                                  controller: nameController,
                                  label: strings.auth_name,
                                  maxLines: 1,
                                  validator: FormFieldValidators.name(
                                    emptyMessage:
                                        strings.auth_validator_name_empty_error,
                                    invalidMessage: strings
                                        .auth_validator_name_invalid_error,
                                    tooShortMessage: strings
                                        .auth_validator_name_too_short_error,
                                  ),
                                ),
                              ],
                              CustomTextFormField(
                                controller: emailController,
                                label: strings.auth_email,
                                maxLines: 1,
                                validator: FormFieldValidators.email(
                                  invalidMessage: strings
                                      .auth_validator_email_invalid_error,
                                  emptyMessage:
                                      strings.auth_validator_email_empty_error,
                                ),
                              ),
                              CustomTextFormField(
                                controller: passwordController,
                                label: strings.auth_password,
                                obscureText: true,
                                maxLines: 1,
                                validator: FormFieldValidators.password(
                                  emptyMessage: strings
                                      .auth_validator_password_empty_error,
                                  tooShortMessage: strings
                                      .auth_validator_password_too_short_error,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AuthButton(
                          onValidate: () =>
                              formKey.currentState?.validate() ?? false,
                          onSignIn: () => bloc.add(
                            SignIn(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                          onSignUp: () => bloc.add(
                            SignUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name:
                                  nameController?.text ??
                                  EmptyConstants.emptyString,
                            ),
                          ),
                          onToggleFormType: () => bloc.add(
                            const ToggleFormType(),
                          ),
                          state: state,
                        ),
                      ],
              );
            },
          ),
        ),
      ),
    );
  }
}
