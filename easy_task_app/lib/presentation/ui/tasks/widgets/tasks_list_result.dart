import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_model.dart';
import '../../../bloc/tasks/tasks_state.dart';
import 'task_grid_view.dart';

class TaskListResult extends StatelessWidget {
  const TaskListResult({
    super.key,
    required this.state,
    required this.onTapItem,
    this.onLoadMore,
    required this.onRetryEmptyState,
  });

  final TasksState state;
  final void Function(EasyTaskModel task) onTapItem;
  final VoidCallback? onLoadMore;
  final VoidCallback onRetryEmptyState;

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    if (state.stateType == TasksStateType.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (state.tasks.isEmpty) {
        return Center(
          child: state.stateType == TasksStateType.success
              ? CustomMessageCard(
            message: strings.tasks_empty_message,
            title: strings.common_empty_title,
          )
              : CustomMessageCard.error(
            message: strings.common_error_message,
            title: strings.common_error_title,
            onPressed: onRetryEmptyState,
            buttonLabel: strings.common_try_again,
          ),
        );
      } else {
        return TaskGridView(
          tasks: state.tasks,
          onTap: onTapItem,
          isPaginating: state.isPaginating,
          hasMore: state.hasMore,
          onLoadMore: onLoadMore,
          stateType: state.stateType,
          onRetry: onRetryEmptyState,
        );
      }
    }
  }
}