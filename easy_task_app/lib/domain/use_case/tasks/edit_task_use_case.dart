import 'package:core/core.dart';

import '../../model/tasks/params/edit_task_params.dart';
import '../../repository/tasks_repository.dart';

class EditTaskUseCase implements BaseUseCase<EditTaskParams, void> {
  EditTaskUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;
  final TasksRepository _tasksRepository;

  @override
  AsyncResult<void> call(EditTaskParams input) async {
    return await _tasksRepository.updateTask(params: input);
  }
}
