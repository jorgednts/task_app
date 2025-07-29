import 'package:core/core.dart';

import '../../domain/model/tasks/easy_task_category_model.dart';
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
    required EasyTaskCategoryModel category,
  }) async {
    try {
      await _remoteDataSource.createCategory(params: category.toQuery());
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }

  @override
  AsyncResult<void> updateCategory({
    required EasyTaskCategoryModel category,
  }) async {
    try {
      await _remoteDataSource.updateCategory(params: category.toQuery());
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
