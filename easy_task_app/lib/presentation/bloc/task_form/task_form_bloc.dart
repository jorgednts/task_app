import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/categories/get_categories_use_case.dart';
import '../../../domain/use_case/tasks/create_task_use_case.dart';
import '../../../domain/use_case/tasks/delete_media_use_case.dart';
import '../../../domain/use_case/tasks/delete_task_use_case.dart';
import '../../../domain/use_case/tasks/edit_task_use_case.dart';
import '../../../domain/use_case/tasks/get_task_by_id_use_case.dart';
import 'task_form_event.dart';
import 'task_form_state.dart';

class TaskFormBloc extends Bloc<TaskFormEvent, TaskFormState> {
  TaskFormBloc({
    required GetCategoriesUseCase getCategoriesUseCase,
    required CreateTaskUseCase createTaskUseCase,
    required EditTaskUseCase editTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
    required DeleteMediaUseCase deleteMediaUseCase,
    required GetTaskByIdUseCase getTaskByIdUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _createTaskUseCase = createTaskUseCase,
       _editTaskUseCase = editTaskUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       _deleteMediaUseCase = deleteMediaUseCase,
       _getTaskByIdUseCase = getTaskByIdUseCase,
       super(const TaskFormInitial()) {
    _onInit();
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final DeleteMediaUseCase _deleteMediaUseCase;
  final GetTaskByIdUseCase _getTaskByIdUseCase;

  void _onInit() {
    on<GetCategoriesTaskForm>(_onGetCategories);
    on<CreateTask>(_onCreateTask);
    on<EditTask>(_onEditTask);
    on<DeleteTask>(_onDeleteTask);
    on<DeleteMedia>(_onDeleteMedia);
    on<UpdateTask>(_onUpdateTask);
  }

  Future<void> _onGetCategories(
    GetCategoriesTaskForm event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(CategoryListState.loading(task: event.task));
    (await _getCategoriesUseCase.call(NoParam())).fold(
      onOk: (result) {
        emit(
          CategoryListState.success(
            categories: result,
            task: event.task,
          ),
        );
      },
      onError: (error) {
        emit(CategoryListState.error(task: event.task));
      },
    );
  }

  Future<void> _onCreateTask(
    CreateTask event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(
      TaskFormOperationState.loading(
        categories: state.categories,
        task: state.task,
      ),
    );
    (await _createTaskUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(
          TaskFormOperationState.success(
            categories: state.categories,
            uploaded: result,
            task: state.task,
          ),
        );
      },
      onError: (error) {
        emit(
          TaskFormOperationState.error(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
    );
  }

  Future<void> _onEditTask(EditTask event, Emitter<TaskFormState> emit) async {
    emit(
      TaskFormOperationState.loading(
        categories: state.categories,
        task: state.task,
      ),
    );
    (await _editTaskUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(
          TaskFormOperationState.success(
            categories: state.categories,
            uploaded: result,
            task: state.task,
          ),
        );
      },
      onError: (error) {
        emit(
          TaskFormOperationState.error(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(
      TaskFormDeleteState.loading(
        categories: state.categories,
        task: state.task,
      ),
    );
    (await _deleteTaskUseCase.call(event.id)).fold(
      onOk: (result) {
        emit(
          TaskFormDeleteState.success(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
      onError: (error) {
        emit(
          TaskFormDeleteState.error(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteMedia(
    DeleteMedia event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(
      MediaDeleteState.loading(
        categories: state.categories,
        task: state.task,
      ),
    );
    (await _deleteMediaUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(
          MediaDeleteState.success(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
      onError: (error) {
        emit(
          MediaDeleteState.error(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateTask(
    UpdateTask event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(
      TaskFormUpdate.loading(
        categories: state.categories,
        task: state.task,
      ),
    );
    (await _getTaskByIdUseCase.call(event.taskId)).fold(
      onOk: (result) {
        emit(
          TaskFormUpdate.success(
            categories: state.categories,
            task: result,
          ),
        );
      },
      onError: (error) {
        emit(
          TaskFormUpdate.loading(
            categories: state.categories,
            task: state.task,
          ),
        );
      },
    );
  }
}
