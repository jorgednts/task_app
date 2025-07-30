import 'package:core/core.dart';

import '../../model/tasks/params/create_category_param.dart';
import '../../repository/categories_repository.dart';

class CreateCategoryUseCase implements BaseUseCase<CreateCategoryParams, void> {
  CreateCategoryUseCase({required CategoriesRepository categoriesRepository})
    : _categoriesRepository = categoriesRepository;

  final CategoriesRepository _categoriesRepository;

  @override
  AsyncResult<void> call(CreateCategoryParams input) async {
    return await _categoriesRepository.createCategory(params: input);
  }
}
