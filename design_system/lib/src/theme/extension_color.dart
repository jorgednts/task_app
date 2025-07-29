import 'package:flutter/material.dart';

import '../../design_system.dart';

class CategoryColorsExtension extends ThemeExtension<CategoryColorsExtension> {
  const CategoryColorsExtension({
    required this.categoryBlue,
    required this.categoryYellow,
    required this.categoryRed,
    required this.categoryOrange,
    required this.categoryPurple,
    required this.categoryBrown,
    required this.categoryGrey,
    required this.categoryGreen,
  });

  final ExtendedColor categoryBlue;
  final ExtendedColor categoryYellow;
  final ExtendedColor categoryRed;
  final ExtendedColor categoryOrange;
  final ExtendedColor categoryPurple;
  final ExtendedColor categoryBrown;
  final ExtendedColor categoryGrey;
  final ExtendedColor categoryGreen;

  @override
  CategoryColorsExtension copyWith({
    ExtendedColor? categoryBlue,
    ExtendedColor? categoryYellow,
    ExtendedColor? categoryRed,
    ExtendedColor? categoryOrange,
    ExtendedColor? categoryPurple,
    ExtendedColor? categoryBrown,
    ExtendedColor? categoryGrey,
    ExtendedColor? categoryGreen,
  }) {
    return CategoryColorsExtension(
      categoryBlue: categoryBlue ?? this.categoryBlue,
      categoryYellow: categoryYellow ?? this.categoryYellow,
      categoryRed: categoryRed ?? this.categoryRed,
      categoryOrange: categoryOrange ?? this.categoryOrange,
      categoryPurple: categoryPurple ?? this.categoryPurple,
      categoryBrown: categoryBrown ?? this.categoryBrown,
      categoryGrey: categoryGrey ?? this.categoryGrey,
      categoryGreen: categoryGreen ?? this.categoryGreen,
    );
  }

  @override
  CategoryColorsExtension lerp(
    ThemeExtension<CategoryColorsExtension>? other,
    double t,
  ) {
    if (other is! CategoryColorsExtension) return this;
    return this;
  }
}
