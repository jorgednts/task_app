import 'dart:math';

import 'package:flutter/material.dart';

import '../../tokens/dimensions/dimensions.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.child,
    this.boxConstraints,
  });

  final Widget child;
  final BoxConstraints? boxConstraints;

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    BoxConstraints? boxConstraints,
  }) async {
    return await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => CustomModalBottomSheet(
        boxConstraints: boxConstraints,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.viewInsetsOf(context);
    return AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: ConstrainedBox(
        constraints:
            boxConstraints ??
            BoxConstraints(
              maxHeight: min(
                MediaQuery.sizeOf(context).height * 0.8,
                HeightResponsiveBreakpoints.medium,
              ),
              maxWidth: min(
                WidthResponsiveBreakpoints.large,
                MediaQuery.sizeOf(context).width,
              ),
            ),
        child: child,
      ),
    );
  }
}
