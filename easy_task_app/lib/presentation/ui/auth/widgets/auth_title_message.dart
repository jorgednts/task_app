import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

class AuthTitleMessage extends StatelessWidget {
  const AuthTitleMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.small,
        children: [
          StyledText.t3(
            strings.auth_welcome_title,
            isBold: true,
          ),
          StyledText.l3(
            strings.auth_welcome_message,
          ),
          const SizedBox(height: Spacing.extraLarge),
        ],
      ),
    );
  }
}
