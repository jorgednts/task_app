import 'dart:io';

import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/model/tasks/params/delete_media_params.dart';
import '../../../../domain/model/tasks/params/get_tasks_filter_params.dart';
import '../../../../domain/model/tasks/params/upload_media_params.dart';
import '../../model/task/easy_task_media_item_response.dart';
import '../../model/task/easy_task_response.dart';
import '../api_constants/supabase_constants.dart';
import 'tasks_remote_data_source.dart';

class TasksRemoteDataSourceImpl implements TasksRemoteDataSource {
  TasksRemoteDataSourceImpl({
    required SupabaseClient supabaseClient,
    required LoggerService logger,
  }) : _supabaseClient = supabaseClient,
       _logger = logger;

  final SupabaseClient _supabaseClient;
  final LoggerService _logger;

  @override
  Future<EasyTaskResponse> createTask({
    required Map<String, dynamic> params,
  }) async {
    try {
      if (params['user_id'] == null) {
        params['user_id'] = _supabaseClient.auth.currentUser!.id;
      }
      final response = await _supabaseClient
          .from(SupabaseConstants.tasksTable)
          .insert(params)
          .select()
          .single();

      _logger.d('Task created: ${response['id']}');
      return EasyTaskResponse.fromJson(response);
    } on PostgrestException catch (e) {
      _logger.e('Failed to create task: $e');
      throw GenericException(message: e.message);
    } catch (e) {
      _logger.e('Failed to create task: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> deleteTask({required String id}) async {
    try {
      await _supabaseClient
          .from(SupabaseConstants.tasksTable)
          .delete()
          .eq('id', id);

      _logger.d('Task deleted: $id');
    } catch (e) {
      _logger.e('Failed to delete task: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<EasyTaskResponse> getTaskById({required String taskId}) async {
    try {
      final response = await Supabase.instance.client
          .from(SupabaseConstants.tasksTable)
          .select()
          .eq('id', taskId)
          .single();

      final result = EasyTaskResponse.fromJson(response);
      _logger.d('Fetched task: ${result.id}');
      return result;
    } catch (e) {
      _logger.e('Failed to fetch task: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<List<EasyTaskResponse>> getTasks({
    required GetTasksFiltersParams filters,
  }) async {
    try {
      final response = await _supabaseClient
          .rpc(
            SupabaseConstants.tasksWithCategory,
            params: filters.toMap(_supabaseClient.auth.currentUser!.id),
          )
          .order('created_at');
      _logger.d('Fetched ${response.length} tasks');
      return (response as List)
          .map(
            (json) => EasyTaskResponse.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      _logger.e('Failed to fetch tasks: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> updateTask({required Map<String, dynamic> params}) async {
    try {
      if (params['user_id'] == null) {
        params['user_id'] = _supabaseClient.auth.currentUser!.id;
      }
      await _supabaseClient
          .from(SupabaseConstants.tasksTable)
          .update(params)
          .eq('id', params['id']);

      _logger.d('Task updated: ${params['id']}');
    } catch (e) {
      _logger.e('Failed to update task: $e');
      throw GenericException(message: e.toString());
    }
  }

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
