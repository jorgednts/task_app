import '../../model/task/easy_task_category_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<EasyTaskCategoryResponse>> getCategories();

  Future<void> createCategory({required Map<String, dynamic> params});

  Future<void> updateCategory({required Map<String, dynamic> params});

  Future<void> deleteCategory({required String categoryId});
}
