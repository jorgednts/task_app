import '../../../domain/model/tasks/easy_task_category_model.dart';
import '../../../domain/model/tasks/easy_task_model.dart';

enum TasksStateType { initial, loading, success, error }

sealed class TasksState {
  const TasksState({
    required this.stateType,
    required this.tasks,
    required this.categories,
    this.currentQuery = '',
  });

  final TasksStateType stateType;
  final List<EasyTaskModel> tasks;
  final List<EasyTaskCategoryModel> categories;
  final String currentQuery;
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
    List<EasyTaskModel> tasks = const [],
    required List<EasyTaskCategoryModel> categories,
    required String currentQuery,
  }) : this(
         tasks: tasks,
         categories: categories,
         stateType: TasksStateType.initial,
         currentQuery: currentQuery,
       );

  const TasksListState.loading({
    List<EasyTaskModel> tasks = const [],
    required List<EasyTaskCategoryModel> categories,
    required String currentQuery,
  }) : this(
         tasks: tasks,
         categories: categories,
         stateType: TasksStateType.loading,
         currentQuery: currentQuery,
       );

  const TasksListState.success({
    required List<EasyTaskModel> tasks,
    required List<EasyTaskCategoryModel> categories,
    required String currentQuery,
    bool hasMore = true,
    bool isPaginating = false,
  }) : this(
         tasks: tasks,
         categories: categories,
         stateType: TasksStateType.success,
         hasMore: hasMore,
         isPaginating: isPaginating,
         currentQuery: currentQuery,
       );

  const TasksListState.error({
    List<EasyTaskModel> tasks = const [],
    required List<EasyTaskCategoryModel> categories,
    required String currentQuery,
  }) : this(
         tasks: tasks,
         categories: categories,
         stateType: TasksStateType.error,
         currentQuery: currentQuery,
       );

  const TasksListState({
    required super.tasks,
    required super.categories,
    required super.stateType,
    required super.currentQuery,
    this.hasMore = true,
    this.isPaginating = false,
  });

  final bool hasMore;
  final bool isPaginating;

  TasksListState copyWith({
    List<EasyTaskModel>? tasks,
    List<EasyTaskCategoryModel>? categories,
    TasksStateType? stateType,
    bool? hasMore,
    bool? isPaginating,
    String? currentQuery,
  }) {
    return TasksListState(
      tasks: tasks ?? this.tasks,
      categories: categories ?? this.categories,
      stateType: stateType ?? this.stateType,
      hasMore: hasMore ?? this.hasMore,
      isPaginating: isPaginating ?? this.isPaginating,
      currentQuery: currentQuery ?? this.currentQuery,
    );
  }
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
