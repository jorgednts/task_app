import 'package:flutter/material.dart';

import '../components.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: FittedBox(
        child: StyledText.b2(
          label,
          isBold: true,
          fontColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
