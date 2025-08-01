import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.boxConstraints,
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;
  final BoxConstraints? boxConstraints;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    BoxConstraints? boxConstraints,
    bool barrierDismissible = true,
  }) async {
    return await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: CustomDialog(
          boxConstraints: boxConstraints,
          message: message,
          title: title,
          onConfirm: onConfirm,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(RadiusSize.large),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        padding: const EdgeInsets.all(Spacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: Spacing.medium,
          children: [
            Row(
              spacing: Spacing.small,
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                StyledText.t2(
                  title,
                  isBold: true,
                  overflow: TextOverflow.ellipsis,
                  fontColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ],
            ),
            Flexible(
              child: StyledText.b3(
                message,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomTextButton(
                label: 'OK',
                onPressed: onConfirm,
                fontColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
