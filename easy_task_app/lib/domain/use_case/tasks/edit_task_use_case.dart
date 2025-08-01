import 'package:core/core.dart';

import '../../model/tasks/params/edit_task_params.dart';
import '../../model/tasks/params/upload_media_params.dart';
import '../../repository/tasks_repository.dart';

class EditTaskUseCase implements BaseUseCase<EditTaskParams, bool> {
  EditTaskUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;
  final TasksRepository _tasksRepository;

  @override
  AsyncResult<bool> call(EditTaskParams input) async {
    final editResult = await _tasksRepository.updateTask(params: input);
    switch (editResult) {
      case Ok():
        if (input.newMedia.isNotEmpty) {
          final uploadResult = await _tasksRepository.uploadMediaFiles(
            params: UploadMediaParams.fromEdit(input),
          );
          switch (uploadResult) {
            case Ok():
              return const Result.ok(true);
            case Error<void>():
              return const Result.ok(false);
          }
        }
        return const Result.ok(true);
      case Error<void>():
        return Result.error(editResult.error);
    }
  }
}
