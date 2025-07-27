import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldMessengerHandler {
  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    showDefaultSnackBar(
      context,
      duration: duration,
      contentColor: Theme.of(context).colorScheme.onErrorContainer,
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      message: message,
      title: title,
      showCloseIcon: showCloseIcon,
      action: action,
    );
  }

  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    showDefaultSnackBar(
      context,
      duration: duration ?? const Duration(seconds: 3),
      contentColor: Theme.of(context).colorScheme.onPrimaryContainer,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      message: message,
      title: title,
      showCloseIcon: showCloseIcon,
      action: action,
    );
  }

  static void showInfoSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
    bool showCloseIcon = true,
  }) {
    showDefaultSnackBar(
      context,
      duration: duration ?? const Duration(seconds: 3),
      contentColor: Theme.of(context).colorScheme.onSurfaceVariant,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      message: message,
      title: title,
      showCloseIcon: showCloseIcon,
      action: action,
    );
  }

  static void showDefaultSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
    Color? contentColor,
    Color? backgroundColor,
    bool showCloseIcon = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 4),
        closeIconColor:
            contentColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
        backgroundColor:
            backgroundColor ??
            Theme.of(context).colorScheme.surfaceContainerHighest,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              StyledText.b3(
                title,
                fontColor:
                    contentColor ??
                    Theme.of(context).colorScheme.onSurfaceVariant,
                isBold: true,
              ),
            ],
            StyledText.b2(
              message,
              fontColor:
                  contentColor ??
                  Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
        showCloseIcon: showCloseIcon,
        action: action,
      ),
    );
  }
}
