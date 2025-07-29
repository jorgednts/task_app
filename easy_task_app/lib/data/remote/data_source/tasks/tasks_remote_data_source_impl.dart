import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  Future<List<EasyTaskResponse>> getAllTasks() async {
    try {
      final response = await _supabaseClient
          .from(SupabaseConstants.tasksTable)
          .select('''
          *,
          task_categories(
            id,
            name,
            color,
            user_id
          )
        ''')
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
}
