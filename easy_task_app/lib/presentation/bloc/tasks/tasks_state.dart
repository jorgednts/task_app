import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../domain/model/tasks/easy_task_model.dart';

enum TasksStateType { initial, loading, success, error }

sealed class TasksState {
  const TasksState({
    required this.stateType,
    required this.tasks,
    required this.categories,
  });

  final TasksStateType stateType;
  final List<EasyTaskModel> tasks;
  final List<EasyTaskCategoryModel> categories;
}

class TasksSignOutState extends TasksState {
  const TasksSignOutState.loading({
    required super.tasks,
    required super.categories,
  }) : super(stateType: TasksStateType.loading);

  const TasksSignOutState.success({
    required super.tasks,
    required super.categories,
  }) : super(stateType: TasksStateType.success);

  const TasksSignOutState.error({
    required super.tasks,
    required super.categories,
  }) : super(stateType: TasksStateType.error);
}

class TasksListState extends TasksState {
  const TasksListState.initial({
    super.tasks = const [],
    required super.categories,
  }) : super(stateType: TasksStateType.initial);

  const TasksListState.loading({
    super.tasks = const [],
    required super.categories,
  }) : super(stateType: TasksStateType.loading);

  const TasksListState.error({
    super.tasks = const [],
    required super.categories,
  }) : super(stateType: TasksStateType.error);

  const TasksListState.success({
    required super.tasks,
    required super.categories,
  }) : super(stateType: TasksStateType.success);
}

class ResetTasksState extends TasksState {
  const ResetTasksState.initial({
    required super.categories,
  }) : super(
         tasks: const [],
         stateType: TasksStateType.initial,
       );
}

class CategoriesListState extends TasksState {
  const CategoriesListState.initial({
    required super.tasks,
    super.categories = const [],
  }) : super(stateType: TasksStateType.initial);

  const CategoriesListState.loading({
    required super.tasks,
    super.categories = const [],
  }) : super(stateType: TasksStateType.loading);

  const CategoriesListState.error({
    required super.tasks,
    super.categories = const [],
  }) : super(stateType: TasksStateType.error);

  const CategoriesListState.success({
    required super.tasks,
    required super.categories,
  }) : super(stateType: TasksStateType.success);
}
