import 'package:core/core.dart';

import '../model/tasks/easy_task_category_model.dart';
import '../model/tasks/params/create_category_param.dart';
import '../model/tasks/params/edit_category_params.dart';

abstract class CategoriesRepository {
  AsyncResult<List<EasyTaskCategoryModel>> getCategories();

  AsyncResult<void> createCategory({
    required CreateCategoryParams params,
  });

  AsyncResult<void> updateCategory({
    required EditCategoryParams params,
  });

  AsyncResult<void> deleteCategory({
    required String categoryId,
  });
}
