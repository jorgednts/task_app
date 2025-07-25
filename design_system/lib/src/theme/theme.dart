import 'package:design_system/src/theme/util.dart';
import 'package:flutter/material.dart';

class CustomTheme {

  const CustomTheme(this.textTheme);

  factory CustomTheme.fromContext(BuildContext context) {
    final textTheme = createTextTheme(context: context);
    return CustomTheme(textTheme);
  }
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4b6544),
      surfaceTint: Color(0xff4b6544),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa5c39b),
      onPrimaryContainer: Color(0xff375131),
      secondary: Color(0xff566252),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd7e3cf),
      onSecondaryContainer: Color(0xff5b6656),
      tertiary: Color(0xff38656e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff94c2cc),
      onTertiaryContainer: Color(0xff225159),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffaf9f4),
      onSurface: Color(0xff1a1c19),
      onSurfaceVariant: Color(0xff434840),
      outline: Color(0xff73796f),
      outlineVariant: Color(0xffc3c8bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312e),
      inversePrimary: Color(0xffb1cfa6),
      primaryFixed: Color(0xffccebc1),
      onPrimaryFixed: Color(0xff082006),
      primaryFixedDim: Color(0xffb1cfa6),
      onPrimaryFixedVariant: Color(0xff334d2e),
      secondaryFixed: Color(0xffdae6d2),
      onSecondaryFixed: Color(0xff141e12),
      secondaryFixedDim: Color(0xffbecab7),
      onSecondaryFixedVariant: Color(0xff3f4a3b),
      tertiaryFixed: Color(0xffbceaf5),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xffa0ced8),
      onTertiaryFixedVariant: Color(0xff1d4d56),
      surfaceDim: Color(0xffdadad5),
      surfaceBright: Color(0xfffaf9f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4ef),
      surfaceContainer: Color(0xffefeee9),
      surfaceContainerHigh: Color(0xffe9e8e3),
      surfaceContainerHighest: Color(0xffe3e3de),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc0dfb5),
      surfaceTint: Color(0xffb1cfa6),
      onPrimary: Color(0xff1d3619),
      primaryContainer: Color(0xffa5c39b),
      onPrimaryContainer: Color(0xff375131),
      secondary: Color(0xffbecab7),
      onSecondary: Color(0xff293326),
      secondaryContainer: Color(0xff3f4a3b),
      onSecondaryContainer: Color(0xffadb9a6),
      tertiary: Color(0xffafdee8),
      onTertiary: Color(0xff00363e),
      tertiaryContainer: Color(0xff94c2cc),
      onTertiaryContainer: Color(0xff225159),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121411),
      onSurface: Color(0xffe3e3de),
      onSurfaceVariant: Color(0xffc3c8bd),
      outline: Color(0xff8d9288),
      outlineVariant: Color(0xff434840),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3de),
      inversePrimary: Color(0xff4b6544),
      primaryFixed: Color(0xffccebc1),
      onPrimaryFixed: Color(0xff082006),
      primaryFixedDim: Color(0xffb1cfa6),
      onPrimaryFixedVariant: Color(0xff334d2e),
      secondaryFixed: Color(0xffdae6d2),
      onSecondaryFixed: Color(0xff141e12),
      secondaryFixedDim: Color(0xffbecab7),
      onSecondaryFixedVariant: Color(0xff3f4a3b),
      tertiaryFixed: Color(0xffbceaf5),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xffa0ced8),
      onTertiaryFixedVariant: Color(0xff1d4d56),
      surfaceDim: Color(0xff121411),
      surfaceBright: Color(0xff383a36),
      surfaceContainerLowest: Color(0xff0d0f0c),
      surfaceContainerLow: Color(0xff1a1c19),
      surfaceContainer: Color(0xff1f201d),
      surfaceContainerHigh: Color(0xff292a27),
      surfaceContainerHighest: Color(0xff343532),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  /// Category Blue
  static const categoryBlue = ExtendedColor(
    seed: Color(0xff7aaac9),
    value: Color(0xff7aaac9),
    light: ColorFamily(
      color: Color(0xff326480),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff326480),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff326480),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
    dark: ColorFamily(
      color: Color(0xff9ccded),
      onColor: Color(0xff00344b),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff9ccded),
      onColor: Color(0xff00344b),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff9ccded),
      onColor: Color(0xff00344b),
      colorContainer: Color(0xff7aaac9),
      onColorContainer: Color(0xff003f59),
    ),
  );

  /// Category Yellow
  static const categoryYellow = ExtendedColor(
    seed: Color(0xfff5dd90),
    value: Color(0xfff5dd90),
    light: ColorFamily(
      color: Color(0xff6e5d1e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff6e5d1e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff6e5d1e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
    dark: ColorFamily(
      color: Color(0xfffffaf6),
      onColor: Color(0xff3b2f00),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xfffffaf6),
      onColor: Color(0xff3b2f00),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xfffffaf6),
      onColor: Color(0xff3b2f00),
      colorContainer: Color(0xfff5dd90),
      onColorContainer: Color(0xff726021),
    ),
  );

  /// Category Red
  static const categoryRed = ExtendedColor(
    seed: Color(0xfff28b82),
    value: Color(0xfff28b82),
    light: ColorFamily(
      color: Color(0xff98443e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff98443e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff98443e),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
    dark: ColorFamily(
      color: Color(0xffffb3ac),
      onColor: Color(0xff5d1715),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb3ac),
      onColor: Color(0xff5d1715),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb3ac),
      onColor: Color(0xff5d1715),
      colorContainer: Color(0xfff28b82),
      onColorContainer: Color(0xff6d2420),
    ),
  );

  /// Category Orange
  static const categoryOrange = ExtendedColor(
    seed: Color(0xfff6b78f),
    value: Color(0xfff6b78f),
    light: ColorFamily(
      color: Color(0xff835332),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff835332),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff835332),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
    dark: ColorFamily(
      color: Color(0xffffd9c3),
      onColor: Color(0xff4d2609),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffd9c3),
      onColor: Color(0xff4d2609),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffd9c3),
      onColor: Color(0xff4d2609),
      colorContainer: Color(0xfff6b78f),
      onColorContainer: Color(0xff744627),
    ),
  );

  /// Category Purple
  static const categoryPurple = ExtendedColor(
    seed: Color(0xffc6a9e0),
    value: Color(0xffc6a9e0),
    light: ColorFamily(
      color: Color(0xff6d5485),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff6d5485),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff6d5485),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
    dark: ColorFamily(
      color: Color(0xffe2c4fd),
      onColor: Color(0xff3d2654),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffe2c4fd),
      onColor: Color(0xff3d2654),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffe2c4fd),
      onColor: Color(0xff3d2654),
      colorContainer: Color(0xffc6a9e0),
      onColorContainer: Color(0xff533c6b),
    ),
  );

  /// Category Brown
  static const categoryBrown = ExtendedColor(
    seed: Color(0xffc6b39e),
    value: Color(0xffc6b39e),
    light: ColorFamily(
      color: Color(0xff6b5c4a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff6b5c4a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff6b5c4a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
    dark: ColorFamily(
      color: Color(0xffe3ceb9),
      onColor: Color(0xff3a2e1f),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffe3ceb9),
      onColor: Color(0xff3a2e1f),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffe3ceb9),
      onColor: Color(0xff3a2e1f),
      colorContainer: Color(0xffc6b39e),
      onColorContainer: Color(0xff534535),
    ),
  );

  /// Category Grey
  static const categoryGrey = ExtendedColor(
    seed: Color(0xffd6d6d6),
    value: Color(0xffd6d6d6),
    light: ColorFamily(
      color: Color(0xff5d5e5f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff5d5e5f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff5d5e5f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
    dark: ColorFamily(
      color: Color(0xfff3f2f2),
      onColor: Color(0xff2f3131),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xfff3f2f2),
      onColor: Color(0xff2f3131),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xfff3f2f2),
      onColor: Color(0xff2f3131),
      colorContainer: Color(0xffd6d6d6),
      onColorContainer: Color(0xff5b5d5d),
    ),
  );

  /// Category Green
  static const categoryGreen = ExtendedColor(
    seed: Color(0xff9acfc3),
    value: Color(0xff9acfc3),
    light: ColorFamily(
      color: Color(0xff34675d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff34675d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff34675d),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
    dark: ColorFamily(
      color: Color(0xffb5ebdf),
      onColor: Color(0xff003730),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffb5ebdf),
      onColor: Color(0xff003730),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffb5ebdf),
      onColor: Color(0xff003730),
      colorContainer: Color(0xff9acfc3),
      onColorContainer: Color(0xff255a50),
    ),
  );

  List<ExtendedColor> get extendedColors => [
    categoryBlue,
    categoryYellow,
    categoryRed,
    categoryOrange,
    categoryPurple,
    categoryBrown,
    categoryGrey,
    categoryGreen,
  ];
}

class ExtendedColor {

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
