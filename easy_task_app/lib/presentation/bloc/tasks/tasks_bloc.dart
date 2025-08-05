import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/sign_out_use_case.dart';
import '../../../domain/use_case/tasks/get_tasks_use_case.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({
    required SignOutUseCase signOutUseCase,
    required GetTasksUseCase getTasksUseCase,
  }) : _signOutUseCase = signOutUseCase,
       _getTasksUseCase = getTasksUseCase,
       super(
         const TasksListState.initial(
           tasks: [],
           currentQuery: '',
         ),
       ) {
    _onInit();
  }

  final SignOutUseCase _signOutUseCase;
  final GetTasksUseCase _getTasksUseCase;

  void _onInit() {
    on<SignOut>(_onSignOut);
    on<InitializeTasks>(_onInitializeTasks);
    on<LoadMoreTasks>(_onLoadMoreTasks);
  }

  Future<void> _onSignOut(SignOut event, Emitter<TasksState> emit) async {
    emit(
      TasksSignOutState.loading(
        tasks: state.tasks,
        currentQuery: state.currentQuery,
        hasMore: state.hasMore,
        isPaginating: state.isPaginating,
      ),
    );

    (await _signOutUseCase.call(NoParam())).fold(
      onOk: (result) {
        emit(
          TasksSignOutState.success(
            tasks: state.tasks,
            currentQuery: state.currentQuery,
            hasMore: state.hasMore,
            isPaginating: state.isPaginating,
          ),
        );
      },
      onError: (error) {
        emit(
          error is NetworkException
              ? TasksSignOutState.networkError(
                  tasks: state.tasks,
                  currentQuery: state.currentQuery,
                  hasMore: state.hasMore,
                  isPaginating: state.isPaginating,
                )
              : TasksSignOutState.error(
                  tasks: state.tasks,
                  currentQuery: state.currentQuery,
                  hasMore: state.hasMore,
                  isPaginating: state.isPaginating,
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
        tasks: state.tasks,
        currentQuery: event.filtersParams.query,
      ),
    );
    (await _getTasksUseCase.call(event.filtersParams)).fold(
      onOk: (result) {
        emit(
          TasksListState.success(
            tasks: result,
            currentQuery: event.filtersParams.query,
          ),
        );
      },
      onError: (error) {
        emit(
          error is NetworkException
              ? TasksListState.networkError(
                  tasks: [],
                  currentQuery: event.filtersParams.query,
                )
              : TasksListState.genericError(
                  tasks: [],
                  currentQuery: event.filtersParams.query,
                ),
        );
      },
    );
  }

  Future<void> _onLoadMoreTasks(
    LoadMoreTasks event,
    Emitter<TasksState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TasksListState ||
        currentState.isPaginating ||
        !currentState.hasMore) {
      return;
    }

    emit(currentState.copyWith(isPaginating: true));

    final response = await _getTasksUseCase.call(event.filtersParams);

    response.fold(
      onOk: (newTasks) {
        final allTasks = [...currentState.tasks, ...newTasks];
        final hasMore = newTasks.length == event.filtersParams.limit;

        emit(
          currentState.copyWith(
            tasks: allTasks,
            hasMore: hasMore,
            isPaginating: false,
            stateType: TasksStateType.success,
          ),
        );
      },
      onError: (error) {
        emit(
          currentState.copyWith(
            isPaginating: false,
            stateType: error is NetworkException
                ? TasksStateType.networkError
                : TasksStateType.genericError,
          ),
        );
      },
    );
  }
}
