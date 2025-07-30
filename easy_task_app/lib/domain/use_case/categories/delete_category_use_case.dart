import 'package:core/core.dart';

import '../../repository/categories_repository.dart';

class DeleteCategoryUseCase implements BaseUseCase<String, void> {
  DeleteCategoryUseCase({required CategoriesRepository categoriesRepository})
    : _categoriesRepository = categoriesRepository;
  final CategoriesRepository _categoriesRepository;

  @override
  AsyncResult<void> call(String input) async {
    return await _categoriesRepository.deleteCategory(categoryId: input);
  }
}
