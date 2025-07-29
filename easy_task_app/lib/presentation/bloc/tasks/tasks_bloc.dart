import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/sign_out_use_case.dart';
import '../../../domain/use_case/categories/get_categories_use_case.dart';
import '../../../domain/use_case/tasks/create_task_use_case.dart';
import '../../../domain/use_case/tasks/delete_task_use_case.dart';
import '../../../domain/use_case/tasks/edit_task_use_case.dart';
import '../../../domain/use_case/tasks/get_tasks_use_case.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({
    required SignOutUseCase signOutUseCase,
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetTasksUseCase getTasksUseCase,
    required CreateTaskUseCase createTaskUseCase,
    required EditTaskUseCase editTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  }) : _signOutUseCase = signOutUseCase,
       _getCategoriesUseCase = getCategoriesUseCase,
       _getTasksUseCase = getTasksUseCase,
       _createTaskUseCase = createTaskUseCase,
       _editTaskUseCase = editTaskUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       super(
         const TasksListState.initial(
           categories: [],
           tasks: [],
         ),
       ) {
    _onInit();
  }

  final SignOutUseCase _signOutUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  void _onInit() {
    on<SignOut>(_onSignOut);
    on<InitializeCategories>(_onInitializeCategories);
    on<InitializeTasks>(_onInitializeTasks);
    on<CreateTask>(_onCreateTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onSignOut(SignOut event, Emitter<TasksState> emit) async {
    emit(
      TasksSignOutState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _signOutUseCase.call(
      NoParam(),
    )).fold(
      onOk: (result) {
        emit(
          TasksSignOutState.success(
            categories: state.categories,
            tasks: state.tasks,
          ),
        );
      },
      onError: (error) {
        emit(
          TasksSignOutState.error(
            categories: state.categories,
            tasks: state.tasks,
          ),
        );
      },
    );
  }

  Future<void> _onInitializeCategories(
    InitializeCategories event,
    Emitter<TasksState> emit,
  ) async {
    emit(
      CategoriesListState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _getCategoriesUseCase.call(
      NoParam(),
    )).fold(
      onOk: (result) {
        emit(
          CategoriesListState.success(
            categories: result,
            tasks: state.tasks,
          ),
        );
      },
      onError: (error) {
        emit(
          CategoriesListState.error(
            categories: [],
            tasks: state.tasks,
          ),
        );
      },
    );
  }

  Future<void> _onInitializeTasks(
    InitializeTasks event,
    Emitter<TasksState> emit,
  ) async {
    emit(
      TasksListState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _getTasksUseCase.call(
      NoParam(),
    )).fold(
      onOk: (result) {
        emit(
          TasksListState.success(
            categories: state.categories,
            tasks: result,
          ),
        );
      },
      onError: (error) {
        emit(
          TasksListState.error(
            categories: state.categories,
            tasks: [],
          ),
        );
      },
    );
  }

  FutureOr<void> _onCreateTask(
    CreateTask event,
    Emitter<TasksState> emit,
  ) async {
    emit(
      TasksListState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _createTaskUseCase.call(
      event.params,
    )).fold(
      onOk: (result) {
        emit(ResetTasksState.initial(categories: state.categories));
      },
      onError: (error) {
        emit(
          TasksListState.error(
            categories: state.categories,
            tasks: [],
          ),
        );
      },
    );
  }

  Future<void> _onEditTask(EditTask event, Emitter<TasksState> emit) async {
    emit(
      TasksListState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _editTaskUseCase.call(
      event.params,
    )).fold(
      onOk: (result) {
        emit(ResetTasksState.initial(categories: state.categories));
      },
      onError: (error) {
        emit(
          TasksListState.error(
            categories: state.categories,
            tasks: state.tasks,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) async {
    emit(
      TasksListState.loading(
        categories: state.categories,
        tasks: state.tasks,
      ),
    );
    (await _deleteTaskUseCase.call(event.id)).fold(
      onOk: (result) {
        emit(ResetTasksState.initial(categories: state.categories));
      },
      onError: (error) {
        emit(
          TasksListState.error(
            categories: state.categories,
            tasks: state.tasks,
          ),
        );
      },
    );
  }
}
