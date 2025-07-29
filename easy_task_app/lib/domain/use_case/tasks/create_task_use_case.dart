import 'package:core/core.dart';

import '../../model/tasks/create_task_params.dart';
import '../../model/tasks/easy_task_model.dart';
import '../../repository/tasks_repository.dart';

class CreateTaskUseCase
    implements BaseUseCase<CreateTaskParams, EasyTaskModel> {
  CreateTaskUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<EasyTaskModel> call(CreateTaskParams input) async {
    return await _tasksRepository.createTask(params: input);
  }
}
