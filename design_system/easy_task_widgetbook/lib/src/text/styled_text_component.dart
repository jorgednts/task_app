import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class StyledTextComponent extends WidgetbookComponent {
  StyledTextComponent()
    : super(
        name: 'StyledTextComponent',
        useCases: [
          WidgetbookUseCase(
            name: 'Typography',
            builder: (context) {
              return const Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: Spacing.medium,
                      children: [
                        StyledText.l1('Label Small'),
                        StyledText.l2('Label Medium'),
                        StyledText.l3('Label Large'),
                        StyledText.b1('Body Small'),
                        StyledText.b2('Body Medium'),
                        StyledText.b3('Body Large'),
                        StyledText.t1('Title Small'),
                        StyledText.t2('Title Medium'),
                        StyledText.t3('Title Large'),
                        StyledText.h1('Heading Small'),
                        StyledText.h2('Heading Medium'),
                        StyledText.h3('Heading Large'),
                        StyledText.d1('Display Small'),
                        StyledText.d2('Display Medium'),
                        StyledText.d3('Display Large'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
