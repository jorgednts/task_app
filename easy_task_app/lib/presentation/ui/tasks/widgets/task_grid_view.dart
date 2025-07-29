import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/tasks/easy_task_model.dart';
import 'task_card.dart';

class TaskGridView extends StatelessWidget {
  const TaskGridView({
    super.key,
    required this.tasks,
    required this.onTap,
  });

  final List<EasyTaskModel> tasks;
  final void Function(EasyTaskModel task) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double itemWidth = min(
              WidthResponsiveBreakpoints.medium / 2,
              constraints.maxWidth,
            );
            return SingleChildScrollView(
              child: Wrap(
                spacing: Spacing.medium,
                runSpacing: Spacing.medium,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: tasks
                    .map(
                      (task) => SizedBox(
                        width: itemWidth,
                        height: HeightResponsiveBreakpoints.medium / 4,
                        child: TaskCard(
                          task: task,
                          onTap: () => onTap(task),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
