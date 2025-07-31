import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../../domain/model/tasks/easy_task_model.dart';
import '../../bloc/task_form/task_form_bloc.dart';
import '../../bloc/task_form/task_form_event.dart';
import '../../bloc/task_form/task_form_state.dart';
import '../../navigation/app_navigator.dart';
import 'widgets/task_form.dart';

class TaskFormPage extends StatelessWidget {
  const TaskFormPage({
    super.key,
    this.task,
  });

  final EasyTaskModel? task;

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: Spacing.medium,
          children: [
            Icon(
              task == null ? Icons.add_task : Icons.task_alt,
              color: theme.colorScheme.onSecondary,
            ),
            FittedBox(
              child: StyledText.t3(
                task == null
                    ? strings.tasks_create_title
                    : strings.tasks_edit_title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontColor: theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        leading: BackButton(color: theme.colorScheme.onSecondary),
        backgroundColor: theme.colorScheme.secondary,
      ),
      body: SafeArea(
        child: BlocConsumer<TaskFormBloc, TaskFormState>(
          listener: (context, state) {
            if (state is TaskFormOperationState) {
              switch (state.type) {
                case TaskFormStateType.loading:
                  break;
                case TaskFormStateType.success:
                  context.pop(true);
                  break;
                case TaskFormStateType.error:
                  ScaffoldMessengerHandler.showErrorSnackBar(
                    context,
                    title: strings.common_error_title,
                    message: strings.common_error_message,
                  );
                  break;
              }
            }
          },
          builder: (context, state) {
            return (state is TaskFormOperationState)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      TaskForm(
                        task: task,
                        state: state,
                        onAddCategory: () async {
                          final bloc = context.read<TaskFormBloc>();
                          await context.navigateToCategoriesPage();
                          bloc.add(
                            const GetCategoriesTaskForm(categories: []),
                          );
                        },
                        onCreateTask: (params) =>
                            context.read<TaskFormBloc>().add(
                              CreateTask(params: params),
                            ),
                        onEditTask: (params) =>
                            context.read<TaskFormBloc>().add(
                              EditTask(params: params),
                            ),
                        onDeleteTask: (id) => context.read<TaskFormBloc>().add(
                          DeleteTask(id: id),
                        ),
                      ),
                      if (state is CategoryListState &&
                          state.type == TaskFormStateType.loading) ...[
                        Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.surface.withValues(alpha: 0.85),
                          child: Center(
                            child: Column(
                              spacing: Spacing.small,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StyledText.t2(
                                  AppIntl.of(
                                    context,
                                  ).tasks_category_loading_message,
                                  isBold: true,
                                ),
                                const CircularProgressIndicator(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
          },
        ),
      ),
    );
  }
}
