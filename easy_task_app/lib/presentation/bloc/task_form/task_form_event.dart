import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../domain/model/tasks/easy_task_model.dart';
import '../../../domain/model/tasks/params/create_task_params.dart';
import '../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../domain/model/tasks/params/edit_task_params.dart';

sealed class TaskFormEvent {
  const TaskFormEvent();
}

class GetCategoriesTaskForm extends TaskFormEvent {
  const GetCategoriesTaskForm({
    required this.categories,
    required this.task,
  });

  final List<EasyTaskCategoryModel> categories;
  final EasyTaskModel? task;
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

class DeleteMedia extends TaskFormEvent {
  const DeleteMedia({
    required this.params,
  });

  final DeleteMediaParams params;
}

class UpdateTask extends TaskFormEvent {
  const UpdateTask({required this.taskId});

  final String taskId;
}
