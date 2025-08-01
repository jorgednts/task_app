import 'package:flutter/material.dart';

import '../../../design_system.dart';

class MediaPickerButton extends StatelessWidget {
  const MediaPickerButton({
    super.key,
    required this.label,
    required this.onShowMediaOptions,
  });

  final String label;
  final void Function() onShowMediaOptions;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onShowMediaOptions,
      icon: const Icon(Icons.add_a_photo),
      label: StyledText.b2(
        label,
        isBold: true,
        fontColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
