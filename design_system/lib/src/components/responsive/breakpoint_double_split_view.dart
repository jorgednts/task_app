import 'dart:math';

import 'package:flutter/material.dart';

import '../../tokens/dimensions/dimensions.dart';

class BreakpointDoubleSplitView extends StatelessWidget {
  const BreakpointDoubleSplitView({
    super.key,
    required this.firstChild,
    required this.secondChild,
    this.breakpoint = WidthResponsiveBreakpoints.small,
    this.firstChildMinHeight = 300.0,
    this.constrainsFirstChild = true,
    this.firstChildDecoration,
    this.forcedAxis,
  });

  final Widget firstChild;
  final Widget secondChild;
  final double breakpoint;
  final double firstChildMinHeight;
  final bool constrainsFirstChild;
  final BoxDecoration? firstChildDecoration;
  final Axis? forcedAxis;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isVerticalSplit = constraints.maxWidth <= breakpoint;
        final childWidth = (isVerticalSplit
            ? constraints.maxWidth
            : (constraints.maxWidth / 2));
        final firstChildHeight = isVerticalSplit
            ? min(firstChildMinHeight, constraints.maxHeight * 0.4)
            : constraints.maxHeight;
        final secondChildHeight = isVerticalSplit
            ? constraints.maxHeight - firstChildHeight
            : constraints.maxHeight;
        return SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction:
                  forcedAxis ??
                  (isVerticalSplit ? Axis.vertical : Axis.horizontal),
              children: [
                Container(
                  width: childWidth,
                  height: firstChildHeight,
                  alignment: Alignment.center,
                  decoration:
                      firstChildDecoration ??
                      BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  constraints: constrainsFirstChild
                      ? BoxConstraints(
                          minHeight: min(
                            firstChildMinHeight,
                            constraints.maxHeight,
                          ),
                        )
                      : null,
                  child: firstChild,
                ),
                SizedBox(
                  width: childWidth,
                  height: secondChildHeight,
                  child: secondChild,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
