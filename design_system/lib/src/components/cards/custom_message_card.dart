import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({
    super.key,
    required this.message,
    required this.title,
    this.onPressed,
    this.buttonLabel,
  }) : _error = false;

  const CustomMessageCard.error({
    super.key,
    required this.message,
    required this.title,
    this.onPressed,
    this.buttonLabel,
  }) : _error = true;

  final String message;
  final String title;
  final bool _error;
  final VoidCallback? onPressed;
  final String? buttonLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final highlightColor = _error
        ? theme.colorScheme.onErrorContainer
        : theme.colorScheme.primary;
    final labelColor = _error
        ? Theme.of(context).colorScheme.errorContainer
        : Theme.of(context).colorScheme.onPrimary;
    return Padding(
      padding: const EdgeInsets.all(Spacing.medium),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusSize.medium),
              border: Border.all(
                color: highlightColor,
                width: 2,
              ),
            ),
            constraints: const BoxConstraints(
              maxWidth: WidthResponsiveBreakpoints.medium,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: Spacing.medium - 5,
            ),
            padding: const EdgeInsets.all(Spacing.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: Spacing.medium,
              children: [
                StyledText.b3(message),
                if (buttonLabel != null && onPressed != null) ...[
                  FilledButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        highlightColor,
                      ),
                    ),
                    child: FittedBox(
                      child: StyledText.b2(
                        buttonLabel!,
                        isBold: true,
                        fontColor: labelColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusSize.medium),
              color: highlightColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.extraSmall,
              horizontal: Spacing.small,
            ),
            margin: const EdgeInsets.symmetric(horizontal: Spacing.small),
            child: StyledText.b2(
              title,
              isBold: true,
              fontColor: labelColor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
