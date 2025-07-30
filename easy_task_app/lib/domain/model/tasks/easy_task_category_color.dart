import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

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
    return switch (this) {
      EasyTaskCategoryColorModel.categoryBlue => extension.categoryBlue.seed,
      EasyTaskCategoryColorModel.categoryYellow =>
        extension.categoryYellow.seed,
      EasyTaskCategoryColorModel.categoryRed => extension.categoryRed.seed,
      EasyTaskCategoryColorModel.categoryOrange =>
        extension.categoryOrange.seed,
      EasyTaskCategoryColorModel.categoryPurple =>
        extension.categoryPurple.seed,
      EasyTaskCategoryColorModel.categoryBrown => extension.categoryBrown.seed,
      EasyTaskCategoryColorModel.categoryGrey => extension.categoryGrey.seed,
      EasyTaskCategoryColorModel.categoryGreen => extension.categoryGreen.seed,
    };
  }

  String translated(AppIntl strings) {
    switch (this) {
      case EasyTaskCategoryColorModel.categoryBlue:
        return strings.category_blue;
      case EasyTaskCategoryColorModel.categoryYellow:
        return strings.category_yellow;
      case EasyTaskCategoryColorModel.categoryRed:
        return strings.category_red;
      case EasyTaskCategoryColorModel.categoryOrange:
        return strings.category_orange;
      case EasyTaskCategoryColorModel.categoryPurple:
        return strings.category_purple;
      case EasyTaskCategoryColorModel.categoryBrown:
        return strings.category_brown;
      case EasyTaskCategoryColorModel.categoryGrey:
        return strings.category_grey;
      case EasyTaskCategoryColorModel.categoryGreen:
        return strings.category_green;
    }
  }
}
