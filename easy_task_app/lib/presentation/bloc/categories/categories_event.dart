import '../../../domain/model/tasks/params/create_category_param.dart';
import '../../../domain/model/tasks/params/edit_category_params.dart';

sealed class CategoriesEvent {
  const CategoriesEvent();
}

class InitCategories extends CategoriesEvent {
  const InitCategories();
}

class CreateCategory extends CategoriesEvent {
  const CreateCategory({required this.params});

  final CreateCategoryParams params;
}

class EditCategory extends CategoriesEvent {
  const EditCategory({required this.params});

  final EditCategoryParams params;
}

class DeleteCategory extends CategoriesEvent {
  const DeleteCategory({required this.id});

  final String id;
}
