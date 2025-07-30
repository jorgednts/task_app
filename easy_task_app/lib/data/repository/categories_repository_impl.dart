import 'package:core/core.dart';

import '../../domain/model/tasks/easy_task_category_model.dart';
import '../../domain/model/tasks/params/create_category_param.dart';
import '../../domain/model/tasks/params/edit_category_params.dart';
import '../../domain/repository/categories_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/categories/categories_remote_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl({
    required CategoriesRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final CategoriesRemoteDataSource _remoteDataSource;

  @override
  AsyncResult<List<EasyTaskCategoryModel>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Result.ok(categories.map((e) => e.toModel()).toList());
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> createCategory({
    required CreateCategoryParams params,
  }) async {
    try {
      await _remoteDataSource.createCategory(params: params.toQuery());
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> updateCategory({
    required EditCategoryParams params,
  }) async {
    try {
      await _remoteDataSource.updateCategory(params: params.toQuery());
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> deleteCategory({
    required String categoryId,
  }) async {
    try {
      await _remoteDataSource.deleteCategory(categoryId: categoryId);
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }
}
