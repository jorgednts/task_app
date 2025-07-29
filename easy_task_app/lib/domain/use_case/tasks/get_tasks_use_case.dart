import 'package:core/core.dart';

import '../../model/tasks/easy_task_model.dart';
import '../../repository/tasks_repository.dart';

class GetTasksUseCase implements BaseUseCase<NoParam, List<EasyTaskModel>> {
  GetTasksUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<List<EasyTaskModel>> call(NoParam input) async {
    return await _tasksRepository.getAllTasks();
  }
}
