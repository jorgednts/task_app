import 'package:core/core.dart';

import '../../model/tasks/easy_task_category_model.dart';
import '../../repository/categories_repository.dart';

class GetCategoriesUseCase
    implements BaseUseCase<NoParam, List<EasyTaskCategoryModel>> {
  GetCategoriesUseCase({required CategoriesRepository categoriesRepository})
    : _categoriesRepository = categoriesRepository;

  final CategoriesRepository _categoriesRepository;

  @override
  AsyncResult<List<EasyTaskCategoryModel>> call(NoParam input) async {
    return await _categoriesRepository.getCategories();
  }
}
