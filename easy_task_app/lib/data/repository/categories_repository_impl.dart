import 'package:core/core.dart';

import '../../domain/model/tasks/easy_task_category_model.dart';
import '../../domain/model/tasks/params/create_category_param.dart';
import '../../domain/model/tasks/params/edit_category_params.dart';
import '../../domain/repository/categories_repository.dart';
import '../mapper/easy_task_mapper.dart';
import '../remote/data_source/categories/categories_remote_data_source.dart';
import '../remote/model/task/easy_task_category_response.dart';

class CategoriesRepositoryImpl extends BaseRepository
    implements CategoriesRepository {
  CategoriesRepositoryImpl({
    required CategoriesRemoteDataSource remoteDataSource,
    required super.networkService,
  }) : _remoteDataSource = remoteDataSource;

  final CategoriesRemoteDataSource _remoteDataSource;

  @override
  AsyncResult<List<EasyTaskCategoryModel>> getCategories() async {
    try {
      final categories =
          await checkInternetConnectionAndExecute<
            void,
            List<EasyTaskCategoryResponse>
          >(
            input: null,
            execute: (_) => _remoteDataSource.getCategories(),
          );
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
      await checkInternetConnectionAndExecute<CreateCategoryParams, void>(
        input: params,
        execute: (input) =>
            _remoteDataSource.createCategory(params: input.toQuery()),
      );
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
      await checkInternetConnectionAndExecute<EditCategoryParams, void>(
        input: params,
        execute: (input) =>
            _remoteDataSource.updateCategory(params: input.toQuery()),
      );
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
      await checkInternetConnectionAndExecute<String, void>(
        input: categoryId,
        execute: (input) =>
            _remoteDataSource.deleteCategory(categoryId: input),
      );
      return const Result.ok(null);
    } on CustomException catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(GenericException(message: e.toString()));
    }
  }
}
