import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

import '../../../../domain/model/tasks/easy_task_model.dart';
import '../../../bloc/tasks/tasks_state.dart';
import 'task_card.dart';

class TaskGridView extends StatefulWidget {
  const TaskGridView({
    super.key,
    required this.tasks,
    required this.onTap,
    this.onLoadMore,
    this.isPaginating = false,
    this.hasMore = true,
    this.stateType = TasksStateType.success,
    this.onRetry,
  });

  final List<EasyTaskModel> tasks;
  final void Function(EasyTaskModel task) onTap;
  final VoidCallback? onLoadMore;
  final bool isPaginating;
  final bool hasMore;
  final TasksStateType stateType;
  final VoidCallback? onRetry;

  @override
  State<TaskGridView> createState() => _TaskGridViewState();
}

class _TaskGridViewState extends State<TaskGridView> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      if (widget.onLoadMore != null &&
          widget.hasMore &&
          !widget.isPaginating &&
          !_hasError) {
        widget.onLoadMore!();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _hasError =>
      widget.stateType == TasksStateType.networkError ||
      widget.stateType == TasksStateType.genericError;

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);

    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        spacing: Spacing.medium,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final double itemWidth = min(
                WidthResponsiveBreakpoints.medium / 2,
                constraints.maxWidth,
              );
              return Wrap(
                spacing: Spacing.medium,
                runSpacing: Spacing.medium,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: widget.tasks
                    .map(
                      (task) => SizedBox(
                        width: itemWidth,
                        height: HeightResponsiveBreakpoints.medium / 4,
                        child: TaskCard(
                          task: task,
                          onTap: () => widget.onTap(task),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          if (widget.isPaginating)
            const CircularProgressIndicator()
          else if (_hasError && widget.onRetry != null) ...[
            StyledText.b2(
              strings.common_error_message,
              isBold: true,
            ),
            FilledButton(
              onPressed: widget.onLoadMore,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              child: FittedBox(
                child: StyledText.b2(
                  strings.common_try_again,
                  isBold: true,
                  fontColor: Theme.of(context).colorScheme.errorContainer,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
