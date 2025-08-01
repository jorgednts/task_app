import 'package:core/core.dart';

import '../../model/tasks/params/delete_media_params.dart';
import '../../repository/tasks_repository.dart';

class DeleteMediaUseCase implements BaseUseCase<DeleteMediaParams, void> {
  DeleteMediaUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<void> call(DeleteMediaParams input) async {
    return await _tasksRepository.deleteMediaFile(params: input);
  }
}
