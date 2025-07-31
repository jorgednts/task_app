import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../domain/model/tasks/params/create_task_params.dart';
import '../../../domain/model/tasks/params/edit_task_params.dart';

sealed class TaskFormEvent {
  const TaskFormEvent();
}

class GetCategoriesTaskForm extends TaskFormEvent {
  const GetCategoriesTaskForm({
    required this.categories,
  });

  final List<EasyTaskCategoryModel> categories;
}

class CreateTask extends TaskFormEvent {
  const CreateTask({required this.params});

  final CreateTaskParams params;
}

class EditTask extends TaskFormEvent {
  const EditTask({required this.params});

  final EditTaskParams params;
}

class DeleteTask extends TaskFormEvent {
  const DeleteTask({
    required this.id,
  });

  final String id;
}
