import 'package:core/core.dart';

import '../../model/tasks/easy_task_model.dart';
import '../../model/tasks/params/create_task_params.dart';
import '../../model/tasks/params/upload_media_params.dart';
import '../../repository/tasks_repository.dart';

class CreateTaskUseCase implements BaseUseCase<CreateTaskParams, bool> {
  CreateTaskUseCase({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository;

  final TasksRepository _tasksRepository;

  @override
  AsyncResult<bool> call(CreateTaskParams input) async {
    final createResult = await _tasksRepository.createTask(params: input);
    switch (createResult) {
      case Ok<EasyTaskModel>():
        if (input.newMedia.isNotEmpty) {
          final uploadResult = await _tasksRepository.uploadMediaFiles(
            params: UploadMediaParams.fromCreate(input, createResult.value.id),
          );
          switch (uploadResult) {
            case Ok():
              return const Result.ok(true);
            case Error<void>():
              return const Result.ok(false);
          }
        }
        return const Result.ok(true);
      case Error<EasyTaskModel>():
        return Result.error(createResult.error);
    }
  }
}
