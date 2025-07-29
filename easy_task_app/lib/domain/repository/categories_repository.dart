import 'package:core/core.dart';

import '../model/tasks/easy_task_category_model.dart';

abstract class CategoriesRepository {
  AsyncResult<List<EasyTaskCategoryModel>> getCategories();

  AsyncResult<void> createCategory({
    required EasyTaskCategoryModel category,
  });

  AsyncResult<void> updateCategory({
    required EasyTaskCategoryModel category,
  });

  AsyncResult<void> deleteCategory({
    required String categoryId,
  });
}
