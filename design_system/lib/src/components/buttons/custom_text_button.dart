import 'package:flutter/material.dart';

import '../components.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isBold = false,
    this.fontColor
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isBold;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: FittedBox(
        child: StyledText.l3(
          label,
          isBold: isBold,
          fontColor: fontColor,
        ),
      ),
    );
  }
}
