import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.hint,
    required this.initialValue,
    required this.options,
    required this.nameBuilder,
    this.leadingBuilder,
    required this.onChanged,
  });

  final String hint;
  final T initialValue;
  final List<T> options;
  final String Function(T selected) nameBuilder;
  final Widget Function(T selected)? leadingBuilder;
  final void Function(T? selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.extraSmall,
      children: [
        StyledText.b3(
          hint,
          isBold: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.medium),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              value: initialValue,
              hint: StyledText.b3(hint),
              isExpanded: true,
              items: options
                  .map(
                    (status) => DropdownMenuItem<T>(
                      value: status,
                      child: Row(
                        spacing: Spacing.small,
                        children: [
                          if (leadingBuilder != null) leadingBuilder!(status),
                          StyledText.b3(
                            nameBuilder(status),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (T? newValue) {
                if (initialValue != newValue) {
                  onChanged(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
