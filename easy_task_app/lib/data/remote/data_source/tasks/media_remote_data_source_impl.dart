import 'dart:io';

import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../../domain/model/tasks/params/upload_media_params.dart';
import '../api_constants/supabase_constants.dart';
import '../../model/task/easy_task_media_item_response.dart';
import 'media_remote_data_source.dart';

class MediaRemoteDataSourceImpl implements MediaRemoteDataSource {
  MediaRemoteDataSourceImpl({
    required SupabaseClient supabaseClient,
    required LoggerService logger,
  }) : _supabaseClient = supabaseClient,
       _logger = logger;

  final SupabaseClient _supabaseClient;
  final LoggerService _logger;

  @override
  Future<List<EasyTaskMediaItemResponse>> uploadMediaFiles({
    required UploadMediaParams params,
  }) async {
    try {
      final mediaItems = <EasyTaskMediaItemResponse>[];
      final userId = _supabaseClient.auth.currentUser!.id;
      final taskId = params.taskId;
      for (final file in params.newMedia) {
        final filePath = '$userId/$taskId/${file.name}';
        final fileToUpload = File(file.path);

        final result = await _supabaseClient.storage
            .from(SupabaseConstants.taskMedia)
            .upload(
              filePath,
              fileToUpload,
              fileOptions: FileOptions(
                contentType: file.mimeType,
                upsert: true,
              ),
            );

        if (result.isEmpty) {
          _logger.e('Failed to upload media file: ${file.name}');
          continue;
        }

        final publicUrl = _supabaseClient.storage
            .from(SupabaseConstants.taskMedia)
            .getPublicUrl(filePath);

        mediaItems.add(
          EasyTaskMediaItemResponse(
            type: file.mimeType,
            url: publicUrl,
          ),
        );
      }

      mediaItems.addAll(
        params.currentMedia
            .map((e) => EasyTaskMediaItemResponse(type: e.type, url: e.url))
            .toList(),
      );

      await _updateTaskTableAfterMediaOperation(
        {
          'media': mediaItems
              .map(
                (item) => {
                  'url': item.url,
                  'type': item.type,
                },
              )
              .toList(),
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        },
        params.taskId,
      );

      _logger.d('Uploaded ${mediaItems.length} media files');
      return mediaItems;
    } catch (e) {
      _logger.e('Failed to upload media files: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> deleteMediaFile({required DeleteMediaParams params}) async {
    try {
      final bucketName = SupabaseConstants.taskMedia;
      final userId = _supabaseClient.auth.currentUser!.id;
      final filePath = '$userId/${params.taskId}/${params.fileName}';
      await Supabase.instance.client.storage.from(bucketName).remove([
        filePath,
      ]);
      _logger.d('Deleted media file: ${params.fileName}');
      final mediaItems = params.currentMedia
          .where((e) => e.fileName != params.fileName)
          .toList();
      await _updateTaskTableAfterMediaOperation({
        'media': mediaItems
            .map(
              (item) => {
                'url': item.url,
                'type': item.type,
              },
            )
            .toList(),
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, params.taskId);
    } catch (e) {
      _logger.e('Failed to delete media file: $e');
      throw GenericException(message: e.toString());
    }
  }

  Future<void> _updateTaskTableAfterMediaOperation(
    Map<String, dynamic> updatedMedia,
    String taskId,
  ) async {
    await _supabaseClient
        .from(SupabaseConstants.tasksTable)
        .update(updatedMedia)
        .eq('id', taskId);
    _logger.d('Updated task table after delete media operation');
  }
}
