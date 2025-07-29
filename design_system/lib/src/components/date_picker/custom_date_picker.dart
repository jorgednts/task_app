import 'package:flutter/material.dart';

import '../../tokens/dimensions/dimensions.dart';
import '../components.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.onDateSelected,
    required this.label,
    required this.title,
    required this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  final void Function(DateTime) onDateSelected;
  final String title;
  final String label;
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  Future<void> _pickDate(
    BuildContext context, {
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.extraSmall,
      children: [
        StyledText.b3(
          title,
          isBold: true,
        ),
        TextButton.icon(
          onPressed: () async => await _pickDate(context),
          icon: const Icon(Icons.calendar_today),
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
