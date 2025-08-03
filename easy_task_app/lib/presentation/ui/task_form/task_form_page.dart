import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../bloc/task_form/task_form_bloc.dart';
import '../../bloc/task_form/task_form_event.dart';
import '../../bloc/task_form/task_form_state.dart';
import '../../navigation/app_navigator.dart';
import 'widgets/task_form.dart';

class TaskFormPage extends StatelessWidget {
  const TaskFormPage({
    super.key,
    required this.mediaService,
  });

  final MediaController mediaService;

  void _showError(BuildContext context, bool isNetwork) {
    final strings = AppIntl.of(context);
    return ScaffoldMessengerHandler.showErrorSnackBar(
      context,
      title: strings.common_error_title,
      message: strings.common_error_message,
    );
  }

  void _showSuccess(BuildContext context) {
    final strings = AppIntl.of(context);
    ScaffoldMessengerHandler.showSuccessSnackBar(
      context,
      title: strings.common_success_title,
      message: strings.common_success_message,
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    final theme = Theme.of(context);
    return BlocConsumer<TaskFormBloc, TaskFormState>(
      listener: (context, state) async {
        if (state is TaskFormOperationState) {
          switch (state.type) {
            case TaskFormStateType.loading:
              break;
            case TaskFormStateType.success:
              if (state.uploaded) {
                context.pop(true);
              } else {
                CustomDialog.show(
                  context,
                  title: strings.tasks_create_with_error_title,
                  message: strings.tasks_create_with_error,
                  onConfirm: () {
                    context.pop();
                    context.pop();
                  },
                );
              }
            case TaskFormStateType.genericError:
              _showError(context, false);
            case TaskFormStateType.networkError:
              _showError(context, true);
          }
        } else if (state is TaskFormDeleteState) {
          switch (state.type) {
            case TaskFormStateType.loading:
              break;
            case TaskFormStateType.success:
              context.pop(true);
            case TaskFormStateType.genericError:
              _showError(context, false);
            case TaskFormStateType.networkError:
              _showError(context, true);
          }
        } else if (state is MediaDeleteState) {
          switch (state.type) {
            case TaskFormStateType.loading:
              break;
            case TaskFormStateType.success:
              if (state.task != null) {
                context.read<TaskFormBloc>().add(
                  UpdateTask(taskId: state.task!.id),
                );
              }
              _showSuccess(context);
            case TaskFormStateType.genericError:
              _showError(context, false);
            case TaskFormStateType.networkError:
              _showError(context, true);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              spacing: Spacing.medium,
              children: [
                Icon(
                  state.task == null ? Icons.add_task : Icons.task_alt,
                  color: theme.colorScheme.onSecondary,
                ),
                FittedBox(
                  child: StyledText.t3(
                    state.task == null
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
            child: Builder(
              builder: (context) {
                return (state.type == TaskFormStateType.loading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : TaskForm(
                        state: state,
                        mediaService: mediaService,
                        onDeleteMedia: (params) => context
                            .read<TaskFormBloc>()
                            .add(DeleteMedia(params: params)),
                        onAddCategory: () async {
                          final bloc = context.read<TaskFormBloc>();
                          await context.navigateToCategoriesPage();
                          bloc.add(
                            GetCategoriesTaskForm(
                              categories: [],
                              task: state.task,
                            ),
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
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
