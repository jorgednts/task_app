import 'package:core/core.dart';

import '../../repository/tasks_repository.dart';

class DeleteTaskUseCase implements BaseUseCase<String, void> {
  DeleteTaskUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;
  final TasksRepository _tasksRepository;

  @override
  AsyncResult<void> call(String input) async {
    return await _tasksRepository.deleteTask(id: input);
  }
}
