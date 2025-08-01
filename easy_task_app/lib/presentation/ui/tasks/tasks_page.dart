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
import '../../navigation/app_navigator.dart';
import '../../navigation/app_route.dart';
import '../common/common_app_bar.dart';
import '../common/common_top_menu.dart';
import '../common/theme_mode_builder.dart';
import 'widgets/task_grid_view.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
    required this.user,
  });

  final EasyTaskUserModel user;

  void onTapFAB(
    BuildContext context,
    TasksState state, {
    EasyTaskModel? task,
  }) async {
    final bloc = context.read<TasksBloc>();
    final result = await context.navigateToTaskFormPage(easyTaskModel: task);
    if (context.mounted) {
      if(result == true) {
        ScaffoldMessengerHandler.showSuccessSnackBar(
          context,
          message: AppIntl.of(context).common_success_message,
          title: AppIntl.of(context).common_success_title,
        );
      }
      bloc.add(
        const InitializeTasks(
          filtersParams: GetTasksFiltersParams(),
        ),
      );
    }
  }

  void blocConsumerListener(BuildContext context, TasksState state) {
    final strings = AppIntl.of(context);
    if (state.stateType == TasksStateType.error) {
      ScaffoldMessengerHandler.showErrorSnackBar(
        context,
        title: strings.common_error_title,
        message: strings.common_error_message,
      );
    } else if (state is TasksSignOutState &&
        state.stateType == TasksStateType.success) {
      if (state.stateType == TasksStateType.success) {
        context.pushReplacementNamed(
          const AuthRoute().name,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppIntl.of(context);
    return ThemeModeBuilder(
      builder: (themeState) {
        return ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: WidthResponsiveBreakpoints.large,
          ),
          child: Scaffold(
            appBar: CommonAppBar(
              appThemeMode: themeState.themeMode,
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.medium),
                  child: BlocConsumer<TasksBloc, TasksState>(
                    listener: blocConsumerListener,
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
                                  onCategoriesPressed: () async {
                                    final bloc = context.read<TasksBloc>();
                                    await context.navigateToCategoriesPage();
                                    bloc.add(
                                      InitializeTasks(
                                        filtersParams: GetTasksFiltersParams(
                                          query: state.currentQuery,
                                        ),
                                      ),
                                    );
                                  },
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
                                  child:
                                      state.stateType == TasksStateType.loading
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : state is TasksListState
                                      ? TaskGridView(
                                          tasks: state.tasks,
                                          onTap: (task) => onTapFAB(
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
                                                      offset:
                                                          state.tasks.length,
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
                              onPressed: () => onTapFAB(context, state),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
