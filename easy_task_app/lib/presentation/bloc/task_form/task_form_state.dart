import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../domain/model/tasks/easy_task_model.dart';

enum TaskFormStateType { loading, success, error }

sealed class TaskFormState {
  const TaskFormState({
    required this.type,
    required this.categories,
    required this.task,
  });

  final TaskFormStateType type;
  final List<EasyTaskCategoryModel> categories;
  final EasyTaskModel? task;
}

class TaskFormInitial extends TaskFormState {
  const TaskFormInitial()
    : super(
        categories: const [],
        task: null,
        type: TaskFormStateType.loading,
      );
}

class CategoryListState extends TaskFormState {
  const CategoryListState.loading({
    super.categories = const [],
    super.task,
  }) : super(type: TaskFormStateType.loading);

  const CategoryListState.success({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.success);

  const CategoryListState.error({
    super.categories = const [],
    super.task,
  }) : super(type: TaskFormStateType.error);
}

class TaskFormOperationState extends TaskFormState {
  const TaskFormOperationState.loading({
    required super.categories,
    required super.task,
  }) : uploaded = false,
       super(type: TaskFormStateType.loading);

  const TaskFormOperationState.success({
    required super.categories,
    required super.task,
    required this.uploaded,
  }) : super(type: TaskFormStateType.success);

  const TaskFormOperationState.error({
    required super.categories,
    required super.task,
  }) : uploaded = false,
       super(type: TaskFormStateType.error);

  final bool uploaded;
}

class TaskFormDeleteState extends TaskFormState {
  const TaskFormDeleteState.loading({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.loading);

  const TaskFormDeleteState.success({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.success);

  const TaskFormDeleteState.error({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.error);
}

class MediaDeleteState extends TaskFormState {
  const MediaDeleteState.loading({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.loading);

  const MediaDeleteState.success({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.success);

  const MediaDeleteState.error({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.error);
}

class TaskFormUpdate extends TaskFormState {
  const TaskFormUpdate.loading({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.loading);

  const TaskFormUpdate.success({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.success);

  const TaskFormUpdate.error({
    required super.categories,
    required super.task,
  }) : super(type: TaskFormStateType.error);
}
