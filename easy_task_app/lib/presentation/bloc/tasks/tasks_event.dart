import '../../../domain/model/tasks/params/create_task_params.dart';
import '../../../domain/model/tasks/params/edit_task_params.dart';
import '../../../domain/model/tasks/params/get_tasks_filter_params.dart';

sealed class TasksEvent {
  const TasksEvent();
}

class SignOut extends TasksEvent {
  const SignOut();
}

class InitializeCategories extends TasksEvent {
  const InitializeCategories();
}

class InitializeTasks extends TasksEvent {
  const InitializeTasks({
    required this.filtersParams,
  });

  final GetTasksFiltersParams filtersParams;
}

class LoadMoreTasks extends TasksEvent {
  const LoadMoreTasks({required this.filtersParams});
  final GetTasksFiltersParams filtersParams;
}

class CreateTask extends TasksEvent {
  const CreateTask({required this.params});

  final CreateTaskParams params;
}

class EditTask extends TasksEvent {
  const EditTask({required this.params});

  final EditTaskParams params;
}

class DeleteTask extends TasksEvent {
  const DeleteTask({required this.id});

  final String id;
}

class CreateCategory extends TasksEvent {
  const CreateCategory();
}
