import '../../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../../domain/model/tasks/params/upload_media_params.dart';
import '../../model/task/easy_task_media_item_response.dart';

abstract class MediaRemoteDataSource {
  Future<void> deleteMediaFile({required DeleteMediaParams params});

  Future<List<EasyTaskMediaItemResponse>> uploadMediaFiles({
    required UploadMediaParams params,
  });
}
