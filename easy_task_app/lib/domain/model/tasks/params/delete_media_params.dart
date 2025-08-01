import '../easy_task_media_item_model.dart';

class DeleteMediaParams {
  DeleteMediaParams({
    required this.taskId,
    required this.fileName,
    required this.currentMedia,
  });

  final String taskId;
  final String fileName;
  final List<EasyTaskMediaItemModel> currentMedia;
}
