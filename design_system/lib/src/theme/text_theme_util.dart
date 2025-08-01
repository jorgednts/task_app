import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tokens/typography/fonts.dart';

abstract class TextThemeUtil {
  static TextTheme createTextTheme({
    required BuildContext context,
    String bodyFontString = Fonts.workSans,
    String displayFontString = Fonts.merriweather,
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
}
