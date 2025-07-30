import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_category_model.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
    required this.categories,
    required this.onAddCategory,
  });

  final EasyTaskCategoryModel? selectedCategory;
  final List<EasyTaskCategoryModel> categories;
  final void Function(EasyTaskCategoryModel? selected) onChanged;
  final VoidCallback onAddCategory;

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    if (categories.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Spacing.extraSmall,
        children: [
          StyledText.b3(
            strings.tasks_category_label,
            isBold: true,
          ),
          CustomTextButton(
            onPressed: () => onChanged(null),
            label: strings.tasks_category_add_message,
          ),
        ],
      );
    }
    return CustomDropdownButton<EasyTaskCategoryModel?>(
      hint: strings.tasks_category_label,
      initialValue: selectedCategory,
      options: categories,
      nameBuilder: (category) => category?.name ?? '-',
      leadingBuilder: (category) => category != null
          ? Container(
              decoration: BoxDecoration(
                color: category.color.materialColor(Theme.of(context)),
                shape: BoxShape.circle,
              ),
              width: RadiusSize.large,
              height: RadiusSize.large,
            )
          : const SizedBox(),
      onChanged: (value) => onChanged(value),
    );
  }
}
