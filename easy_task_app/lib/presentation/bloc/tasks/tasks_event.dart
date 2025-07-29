import '../../../domain/model/tasks/create_task_params.dart';
import '../../../domain/model/tasks/edit_task_params.dart';

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
  const InitializeTasks();
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
