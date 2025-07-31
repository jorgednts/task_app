import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/categories/get_categories_use_case.dart';
import '../../../domain/use_case/tasks/create_task_use_case.dart';
import '../../../domain/use_case/tasks/delete_task_use_case.dart';
import '../../../domain/use_case/tasks/edit_task_use_case.dart';
import 'task_form_event.dart';
import 'task_form_state.dart';

class TaskFormBloc extends Bloc<TaskFormEvent, TaskFormState> {
  TaskFormBloc({
    required GetCategoriesUseCase getCategoriesUseCase,
    required CreateTaskUseCase createTaskUseCase,
    required EditTaskUseCase editTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _createTaskUseCase = createTaskUseCase,
       _editTaskUseCase = editTaskUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       super(const TaskFormInitial()) {
    _onInit();
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  void _onInit() {
    on<GetCategoriesTaskForm>(_onGetCategories);
    on<CreateTask>(_onCreateTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onGetCategories(
    GetCategoriesTaskForm event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(const CategoryListState.loading());
    (await _getCategoriesUseCase.call(NoParam())).fold(
      onOk: (result) {
        emit(CategoryListState.success(categories: result));
      },
      onError: (error) {
        emit(const CategoryListState.error());
      },
    );
  }

  Future<void> _onCreateTask(
    CreateTask event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(
      TaskFormOperationState.loading(categories: state.categories),
    );
    (await _createTaskUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(
          TaskFormOperationState.success(categories: state.categories),
        );
      },
      onError: (error) {
        emit(TaskFormOperationState.error(categories: state.categories));
      },
    );
  }

  Future<void> _onEditTask(EditTask event, Emitter<TaskFormState> emit) async {
    emit(TaskFormOperationState.loading(categories: state.categories));
    (await _editTaskUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(
          TaskFormOperationState.success(categories: state.categories),
        );
      },
      onError: (error) {
        emit(TaskFormOperationState.error(categories: state.categories));
      },
    );
  }

  Future<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(TaskFormOperationState.loading(categories: state.categories));
    (await _deleteTaskUseCase.call(event.id)).fold(
      onOk: (result) {
        emit(TaskFormOperationState.success(categories: state.categories));
      },
      onError: (error) {
        emit(TaskFormOperationState.error(categories: state.categories));
      },
    );
  }
}
