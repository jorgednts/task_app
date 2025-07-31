import '../../../domain/model/tasks/easy_task_category_model.dart';

enum TaskFormStateType { loading, success, error }

sealed class TaskFormState {
  const TaskFormState({
    required this.type,
    required this.categories,
  });

  final TaskFormStateType type;
  final List<EasyTaskCategoryModel> categories;
}

class TaskFormInitial extends TaskFormState {
  const TaskFormInitial()
    : super(
        categories: const [],
        type: TaskFormStateType.loading,
      );
}

class CategoryListState extends TaskFormState {
  const CategoryListState.loading({
    super.categories = const [],
  }) : super(type: TaskFormStateType.loading);

  const CategoryListState.success({
    required super.categories,
  }) : super(type: TaskFormStateType.success);

  const CategoryListState.error({
    super.categories = const [],
  }) : super(type: TaskFormStateType.error);
}

class TaskFormOperationState extends TaskFormState {
  const TaskFormOperationState.loading({
    required super.categories,
  }) : super(type: TaskFormStateType.loading);

  const TaskFormOperationState.success({
    required super.categories,
  }) : super(type: TaskFormStateType.success);

  const TaskFormOperationState.error({
    required super.categories,
  }) : super(type: TaskFormStateType.error);
}
