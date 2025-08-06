import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomDatePickerComponent extends WidgetbookComponent {
  CustomDatePickerComponent()
    : super(
        name: 'CustomDatePicker',
        useCases: [
          WidgetbookUseCase(
            name: 'Generic',
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: CustomDatePicker(
                    onDateSelected: (date) {
                      debugPrint('Selected date: $date');
                    },
                    label: 'Date Picker',
                    title: 'Date Picker Title',
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
