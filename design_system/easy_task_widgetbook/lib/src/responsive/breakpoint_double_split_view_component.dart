import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class BreakpointDoubleSplitViewComponent extends WidgetbookComponent {
  BreakpointDoubleSplitViewComponent()
    : super(
        name: 'BreakpointDoubleSplitView',
        useCases: [
          WidgetbookUseCase(
            name: 'Generic',
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: BreakpointDoubleSplitView(
                    firstChild: Placeholder(
                      strokeWidth: 0.5,
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: const StyledText.h2('LOGO PLACEHOLDER'),
                    ),
                    secondChild: const Center(
                      child: Placeholder(
                        strokeWidth: 0.5,
                        child: StyledText.b3('CONTENT PLACEHOLDER'),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
