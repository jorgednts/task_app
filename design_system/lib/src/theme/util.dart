import 'package:design_system/src/tokens/typography/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme({
  required BuildContext context,
  String bodyFontString = Fonts.openSans,
  String displayFontString = Fonts.robotoCondensed,
}) {
  final baseTextTheme = Theme.of(context).textTheme;
  final bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );
  final displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  final textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
