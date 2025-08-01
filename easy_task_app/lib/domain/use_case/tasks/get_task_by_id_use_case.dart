import 'package:core/core.dart';

import '../../model/tasks/easy_task_model.dart';
import '../../repository/tasks_repository.dart';

class GetTaskByIdUseCase implements BaseUseCase<String, EasyTaskModel> {
  GetTaskByIdUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<EasyTaskModel> call(String input) async {
    return await _tasksRepository.getTaskById(id: input);
  }
}
