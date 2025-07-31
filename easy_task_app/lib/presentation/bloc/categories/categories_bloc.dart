import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/categories/create_category_use_case.dart';
import '../../../domain/use_case/categories/delete_category_use_case.dart';
import '../../../domain/use_case/categories/edit_category_use_case.dart';
import '../../../domain/use_case/categories/get_categories_use_case.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({
    required GetCategoriesUseCase getCategoriesUseCase,
    required CreateCategoryUseCase createCategoryUseCase,
    required EditCategoryUseCase editCategoryUseCase,
    required DeleteCategoryUseCase deleteCategoryUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _createCategoryUseCase = createCategoryUseCase,
       _editCategoryUseCase = editCategoryUseCase,
       _deleteCategoryUseCase = deleteCategoryUseCase,
       super(const CategoriesInitialState()) {
    _onInit();
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final CreateCategoryUseCase _createCategoryUseCase;
  final EditCategoryUseCase _editCategoryUseCase;
  final DeleteCategoryUseCase _deleteCategoryUseCase;

  void _onInit() {
    on<InitCategories>(_onInitializeCategories);
    on<CreateCategory>(_onCreateCategory);
    on<EditCategory>(_onEditCategory);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _onInitializeCategories(
    InitCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesListLoadingState(categories: state.categories));
    (await _getCategoriesUseCase.call(NoParam())).fold(
      onOk: (result) {
        emit(CategoriesListSuccessState(categories: result));
      },
      onError: (error) {
        emit(CategoryErrorState(categories: state.categories));
      },
    );
  }

  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoryLoadingState(categories: state.categories));
    (await _createCategoryUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(CategorySuccessState(categories: state.categories));
      },
      onError: (error) {
        emit(CategoryErrorState(categories: state.categories));
      },
    );
  }

  Future<void> _onEditCategory(
    EditCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoryLoadingState(categories: state.categories));
    (await _editCategoryUseCase.call(event.params)).fold(
      onOk: (result) {
        emit(CategorySuccessState(categories: state.categories));
      },
      onError: (error) {
        emit(CategoryErrorState(categories: state.categories));
      },
    );
  }

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoryLoadingState(categories: state.categories));
    (await _deleteCategoryUseCase.call(event.id)).fold(
      onOk: (result) {
        emit(CategorySuccessState(categories: state.categories));
      },
      onError: (error) {
        emit(CategoryErrorState(categories: state.categories));
      },
    );
  }
}
