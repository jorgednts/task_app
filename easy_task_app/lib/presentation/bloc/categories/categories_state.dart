import '../../../domain/model/tasks/easy_task_category_model.dart';

sealed class CategoriesState {
  const CategoriesState({required this.categories});

  final List<EasyTaskCategoryModel> categories;
}

class CategoriesInitialState extends CategoriesState {
  const CategoriesInitialState() : super(categories: const []);
}

class CategoriesListSuccessState extends CategoriesState {
  const CategoriesListSuccessState({required super.categories});
}

class CategoryLoadingState extends CategoriesState {
  const CategoryLoadingState({required super.categories});
}

class CategoriesListLoadingState extends CategoriesState {
  const CategoriesListLoadingState({required super.categories});
}

class CategoryErrorState extends CategoriesState {
  const CategoryErrorState({required super.categories});
}

class CategoriesListErrorState extends CategoriesState {
  const CategoriesListErrorState({required super.categories});
}

class CategorySuccessState extends CategoriesState {
  const CategorySuccessState({required super.categories});
}
