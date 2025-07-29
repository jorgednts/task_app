import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internationalization/internationalization.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../constants/image_constants.dart';
import '../../navigation/app_navigator.dart';
import '../common/common_app_bar.dart';
import '../common/theme_mode_builder.dart';
import 'widgets/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  String _getAuthApiErrorMessage(
    BuildContext context,
    AuthApiErrorCode errorCode,
  ) {
    final appIntl = AppIntl.of(context);
    switch (errorCode) {
      case AuthApiErrorCode.emailNotConfirmed:
        return appIntl.auth_error_email_not_confirmed;
      case AuthApiErrorCode.emailAddressInvalid:
        return appIntl.auth_error_email_address_invalid;
      case AuthApiErrorCode.emailExists:
        return appIntl.auth_error_email_exists;
      case AuthApiErrorCode.weakPassword:
        return appIntl.auth_error_weak_password;
      case AuthApiErrorCode.invalidCredentials:
        return appIntl.auth_error_invalid_credentials;
      case AuthApiErrorCode.generic:
        return appIntl.auth_error_generic;
    }
  }

  void handleError(BuildContext context, String message) {
    ScaffoldMessengerHandler.showErrorSnackBar(
      context,
      title: AppIntl.of(context).common_error_title,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surfaceContainerHigh;
    return ThemeModeBuilder(
      builder: (state) {
        return Scaffold(
          appBar: CommonAppBar(
            appThemeMode: state.themeMode,
            statusBarColor: backgroundColor,
          ),
          body: SafeArea(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state) {
                  case AuthInitial():
                  case AuthLoading():
                    return;
                  case AuthSuccess():
                    context.navigateToTasksPage(easyTaskUserModel: state.user);
                    break;
                  case AuthNetworkError():
                    handleError(
                      context,
                      AppIntl.of(context).auth_error_network,
                    );
                    break;
                  case AuthGenericError():
                    handleError(
                      context,
                      AppIntl.of(context).auth_error_generic,
                    );
                    break;
                  case AuthApiError():
                    handleError(
                      context,
                      _getAuthApiErrorMessage(context, state.errorCode),
                    );
                    break;
                }
              },
              child: BreakpointDoubleSplitView(
                firstChildDecoration: BoxDecoration(
                  color: backgroundColor,
                ),
                firstChild: Padding(
                  padding: const EdgeInsets.all(Spacing.large),
                  child: CustomSvgImage(
                    assetName: SvgConstants.expandedLogo,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                secondChild: const AuthForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
