import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
  });

  final EasyTaskModel task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormatter = DateFormat.yMd(
      Localizations.localeOf(context).toString(),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          border: Border.all(
            color: task.status.color(theme.colorScheme).withValues(alpha: 0.4),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(RadiusSize.medium),
        ),
        padding: const EdgeInsets.all(Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Spacing.small,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: Spacing.small,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.extraSmall,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: task.status
                        .color(theme.colorScheme)
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(RadiusSize.small),
                  ),
                  child: StyledText.b1(
                    task.status.translated(AppIntl.of(context)),
                    fontColor: task.status.color(theme.colorScheme),
                    isBold: true,
                  ),
                ),
                if (task.category != null)
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.extraSmall,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: task.category!.color
                            .materialColor(theme)
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(RadiusSize.small),
                      ),
                      child: Row(
                        spacing: Spacing.extraSmall,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            child: Icon(
                              Icons.style_rounded,
                              size: IconSize.extraSmall,
                              color: task.category!.color.materialColor(theme),
                            ),
                          ),
                          Flexible(
                            child: StyledText.b1(
                              task.category!.name,
                              fontColor: task.category!.color.materialColor(
                                theme,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            StyledText.t2(
              task.title,
              isBold: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Expanded(
              child: StyledText.l2(
                task.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                fontColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            Row(
              spacing: Spacing.extraSmall,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: theme.colorScheme.onSurface,
                ),
                StyledText.b1(
                  dateFormatter.format(task.dueDate),
                  fontColor: theme.colorScheme.onSurface,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
