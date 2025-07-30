import 'package:core/core.dart';

import '../../model/tasks/params/edit_category_params.dart';
import '../../repository/categories_repository.dart';

class EditCategoryUseCase implements BaseUseCase<EditCategoryParams, void> {
  EditCategoryUseCase({required CategoriesRepository categoriesRepository})
    : _categoriesRepository = categoriesRepository;

  final CategoriesRepository _categoriesRepository;

  @override
  AsyncResult<void> call(EditCategoryParams input) async {
    return await _categoriesRepository.updateCategory(params: input);
  }
}
