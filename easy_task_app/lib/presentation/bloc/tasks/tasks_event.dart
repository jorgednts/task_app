import '../../../domain/model/tasks/params/get_tasks_filter_params.dart';

sealed class TasksEvent {
  const TasksEvent();
}

class SignOut extends TasksEvent {
  const SignOut();
}

class InitializeTasks extends TasksEvent {
  const InitializeTasks({
    required this.filtersParams,
  });

  final GetTasksFiltersParams filtersParams;
}

class LoadMoreTasks extends TasksEvent {
  const LoadMoreTasks({
    required this.filtersParams,
  });

  final GetTasksFiltersParams filtersParams;
}
