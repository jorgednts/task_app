import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum EasyTaskCategoryColorModel {
  categoryBlue,
  categoryYellow,
  categoryRed,
  categoryOrange,
  categoryPurple,
  categoryBrown,
  categoryGrey,
  categoryGreen;

  factory EasyTaskCategoryColorModel.fromName(String name) {
    switch (name) {
      case 'categoryBlue':
        return categoryBlue;
      case 'categoryYellow':
        return categoryYellow;
      case 'categoryRed':
        return categoryRed;
      case 'categoryOrange':
        return categoryOrange;
      case 'categoryPurple':
        return categoryPurple;
      case 'categoryBrown':
        return categoryBrown;
      case 'categoryGrey':
        return categoryGrey;
      case 'categoryGreen':
        return categoryGreen;
      default:
        throw ArgumentError('Invalid category color name: $name');
    }
  }

  Color materialColor(ThemeData theme) {
    final extension = theme.extension<CategoryColorsExtension>();
    if (extension == null) {
      throw Exception(
        'CategoryColorsExtension is not found in the current theme.',
      );
    }
    final isDarkTheme = theme.brightness == Brightness.dark;
    final color = switch (this) {
      EasyTaskCategoryColorModel.categoryBlue => extension.categoryBlue,
      EasyTaskCategoryColorModel.categoryYellow => extension.categoryYellow,
      EasyTaskCategoryColorModel.categoryRed => extension.categoryRed,
      EasyTaskCategoryColorModel.categoryOrange => extension.categoryOrange,
      EasyTaskCategoryColorModel.categoryPurple => extension.categoryPurple,
      EasyTaskCategoryColorModel.categoryBrown => extension.categoryBrown,
      EasyTaskCategoryColorModel.categoryGrey => extension.categoryGrey,
      EasyTaskCategoryColorModel.categoryGreen => extension.categoryGreen,
    };
    return isDarkTheme ? color.dark.color : color.light.color;
  }
}
