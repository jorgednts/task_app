import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internationalization/internationalization.dart';

import '../../../domain/model/tasks/easy_task_model.dart';
import '../../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../../domain/model/user/easy_task_user_model.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../bloc/tasks/tasks_event.dart';
import '../../bloc/tasks/tasks_state.dart';
import '../../navigation/app_route.dart';
import '../common/common_app_bar.dart';
import '../common/common_top_menu.dart';
import '../common/theme_mode_builder.dart';
import 'widgets/task_form.dart';
import 'widgets/task_grid_view.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
    required this.user,
  });

  final EasyTaskUserModel user;

  void handleTaskOperation(
    BuildContext context,
    TasksState state, {
    EasyTaskModel? task,
  }) async {
    final bloc = context.read<TasksBloc>();
    final result = await CustomModalBottomSheet.show<TasksEvent?>(
      context,
      child: TaskForm(
        categories: state.categories,
        task: task,
      ),
    );
    if (result != null) {
      bloc.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return ThemeModeBuilder(
      builder: (themeState) {
        return Scaffold(
          appBar: CommonAppBar(
            appThemeMode: themeState.themeMode,
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: SafeArea(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: WidthResponsiveBreakpoints.large,
              ),
              padding: const EdgeInsets.all(Spacing.medium),
              child: BlocConsumer<TasksBloc, TasksState>(
                listener: (context, state) {
                  if (state.stateType == TasksStateType.error) {
                    ScaffoldMessengerHandler.showErrorSnackBar(
                      context,
                      title: strings.common_error_title,
                      message: strings.common_error_message,
                    );
                  } else {
                    switch (state) {
                      case TasksSignOutState():
                        if (state.stateType == TasksStateType.success) {
                          context.pushReplacementNamed(
                            const AuthRoute().name,
                          );
                        }
                      case TasksListState():
                        break;
                      case ResetTasksState():
                        ScaffoldMessengerHandler.showSuccessSnackBar(
                          context,
                          message: strings.common_success_message,
                          title: strings.common_success_title,
                        );
                        context.read<TasksBloc>().add(
                          const InitializeTasks(
                            filtersParams: GetTasksFiltersParams(),
                          ),
                        );
                        break;
                      case CategoriesListState():
                        break;
                    }
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          spacing: Spacing.medium,
                          children: [
                            CommonTopMenu(
                              username: user.name,
                              onLogoutPressed: () =>
                                  context.read<TasksBloc>().add(
                                    const SignOut(),
                                  ),
                            ),
                            CustomSearchTextField(
                              label: strings.tasks_search_label,
                              searchTooltip: strings.common_search_tooltip,
                              clearTooltip: strings.common_clear_tooltip,
                              onSearch: (filter) =>
                                  context.read<TasksBloc>().add(
                                    InitializeTasks(
                                      filtersParams: GetTasksFiltersParams(
                                        query: filter,
                                      ),
                                    ),
                                  ),
                              onClear: () => context.read<TasksBloc>().add(
                                const InitializeTasks(
                                  filtersParams: GetTasksFiltersParams(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: state.stateType == TasksStateType.loading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : state is TasksListState
                                  ? TaskGridView(
                                      tasks: state.tasks,
                                      onTap: (task) => handleTaskOperation(
                                        context,
                                        state,
                                        task: task,
                                      ),
                                      isPaginating: state.isPaginating,
                                      hasMore: state.hasMore,
                                      onLoadMore: () {
                                        context.read<TasksBloc>().add(
                                          LoadMoreTasks(
                                            filtersParams:
                                                GetTasksFiltersParams(
                                                  query: state.currentQuery,
                                                  offset: state.tasks.length,
                                                ),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () => handleTaskOperation(context, state),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
