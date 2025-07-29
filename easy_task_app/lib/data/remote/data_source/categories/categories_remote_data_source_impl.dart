import 'package:core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/task/easy_task_category_response.dart';
import '../api_constants/supabase_constants.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  CategoriesRemoteDataSourceImpl({
    required SupabaseClient supabaseClient,
    required LoggerService logger,
  }) : _supabaseClient = supabaseClient,
       _logger = logger;

  final SupabaseClient _supabaseClient;
  final LoggerService _logger;

  @override
  Future<List<EasyTaskCategoryResponse>> getCategories() async {
    try {
      final response = await _supabaseClient
          .from(SupabaseConstants.tasksCategories)
          .select();

      _logger.d('Fetched ${response.length} categories');
      return (response as List)
          .map((json) => EasyTaskCategoryResponse.fromJson(json))
          .toList();
    } catch (e) {
      _logger.e('Failed to get categories: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> createCategory({required Map<String, dynamic> params}) async {
    try {
      final response = await _supabaseClient
          .from(SupabaseConstants.tasksCategories)
          .insert(params);

      if (response == null) {
        _logger.e('Failed to create category');
        throw const GenericException(message: 'Failed to create category');
      }
    } catch (e) {
      _logger.e('Failed to create categories: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> updateCategory({required Map<String, dynamic> params}) async {
    try {
      await _supabaseClient
          .from(SupabaseConstants.tasksCategories)
          .update({
            'name': params['name'],
            'color': params['color'],
          })
          .eq('id', params['id']);
    } catch (e) {
      _logger.e('Failed to update categories: $e');
      throw GenericException(message: e.toString());
    }
  }

  @override
  Future<void> deleteCategory({required String categoryId}) async {
    try {
      await _supabaseClient
          .from(SupabaseConstants.tasksCategories)
          .delete()
          .eq('id', categoryId);
    } catch (e) {
      _logger.e('Failed to delete categories: $e');
      throw GenericException(message: e.toString());
    }
  }
}
