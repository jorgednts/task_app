import '../../../domain/model/tasks/easy_task_model.dart';

enum TasksStateType { initial, loading, success, error }

sealed class TasksState {
  const TasksState({
    required this.stateType,
    required this.tasks,
    this.currentQuery = '',
  });

  final TasksStateType stateType;
  final List<EasyTaskModel> tasks;
  final String currentQuery;
}

class TasksSignOutState extends TasksState {
  const TasksSignOutState.loading({
    required super.tasks,
  }) : super(stateType: TasksStateType.loading);

  const TasksSignOutState.success({
    required super.tasks,
  }) : super(stateType: TasksStateType.success);

  const TasksSignOutState.error({
    required super.tasks,
  }) : super(stateType: TasksStateType.error);
}

class TasksListState extends TasksState {
  const TasksListState.initial({
    List<EasyTaskModel> tasks = const [],
    required String currentQuery,
  }) : this(
         tasks: tasks,
         stateType: TasksStateType.initial,
         currentQuery: currentQuery,
       );

  const TasksListState.loading({
    List<EasyTaskModel> tasks = const [],
    required String currentQuery,
  }) : this(
         tasks: tasks,
         stateType: TasksStateType.loading,
         currentQuery: currentQuery,
       );

  const TasksListState.success({
    required List<EasyTaskModel> tasks,
    required String currentQuery,
    bool hasMore = true,
    bool isPaginating = false,
  }) : this(
         tasks: tasks,
         stateType: TasksStateType.success,
         hasMore: hasMore,
         isPaginating: isPaginating,
         currentQuery: currentQuery,
       );

  const TasksListState.error({
    List<EasyTaskModel> tasks = const [],
    required String currentQuery,
  }) : this(
         tasks: tasks,
         stateType: TasksStateType.error,
         currentQuery: currentQuery,
       );

  const TasksListState({
    required super.tasks,
    required super.stateType,
    required super.currentQuery,
    this.hasMore = true,
    this.isPaginating = false,
  });

  final bool hasMore;
  final bool isPaginating;

  TasksListState copyWith({
    List<EasyTaskModel>? tasks,
    TasksStateType? stateType,
    bool? hasMore,
    bool? isPaginating,
    String? currentQuery,
  }) {
    return TasksListState(
      tasks: tasks ?? this.tasks,
      stateType: stateType ?? this.stateType,
      hasMore: hasMore ?? this.hasMore,
      isPaginating: isPaginating ?? this.isPaginating,
      currentQuery: currentQuery ?? this.currentQuery,
    );
  }
}
