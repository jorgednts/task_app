import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomMessageCardComponent extends WidgetbookComponent {
  CustomMessageCardComponent()
    : super(
        name: 'CustomMessageCard',
        useCases: [
          WidgetbookUseCase(
            name: 'Generic',
            builder: (context) {
              return const Scaffold(
                body: Center(
                  child: CustomMessageCard(
                    title: 'Title',
                    message:
                        'This is a sample message for the custom message card',
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Error',
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: CustomMessageCard.error(
                    title: 'Error',
                    message:
                        'This is a sample error message for the custom message card',
                    buttonLabel: 'Retry',
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ],
      );
}
