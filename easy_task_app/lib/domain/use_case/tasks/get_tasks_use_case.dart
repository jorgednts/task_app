import 'package:core/core.dart';

import '../../model/tasks/easy_task_model.dart';
import '../../model/tasks/params/get_tasks_filter_params.dart';
import '../../repository/tasks_repository.dart';

class GetTasksUseCase
    implements BaseUseCase<GetTasksFiltersParams, List<EasyTaskModel>> {
  GetTasksUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<List<EasyTaskModel>> call(GetTasksFiltersParams input) async {
    return await _tasksRepository.getAllTasks(filtersParams: input);
  }
}
