import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/tasks/easy_task_category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  final EasyTaskCategoryModel category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          border: Border.all(
            color: category.color.materialColor(theme).withValues(alpha: 0.4),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(RadiusSize.medium),
        ),
        padding: const EdgeInsets.all(Spacing.small),
        child: Row(
          spacing: Spacing.medium,
          children: [
            Container(
              decoration: BoxDecoration(
                color: category.color.materialColor(theme),
                shape: BoxShape.circle,
              ),
              width: RadiusSize.large,
              height: RadiusSize.large,
            ),
            StyledText.t2(
              category.name,
              isBold: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
