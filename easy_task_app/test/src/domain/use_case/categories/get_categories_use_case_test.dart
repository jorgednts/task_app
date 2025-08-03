import 'package:core/core.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_model.dart';
import 'package:easy_task_app/domain/use_case/categories/get_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'create_category_use_case_test.mocks.dart';

void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  late GetCategoriesUseCase useCase;

  setUp(
    () {
      mockCategoriesRepository = MockCategoriesRepository();
      useCase = GetCategoriesUseCase(
        categoriesRepository: mockCategoriesRepository,
      );
    },
  );

  provideDummy<Result<List<EasyTaskCategoryModel>>>(const Result.ok([]));

  test('GIVEN a call '
      'WHEN getCategories is called '
      'THEN it should call the repository once', () async {
    when(
      mockCategoriesRepository.getCategories(),
    ).thenAnswer((_) async => const Result.ok([]));
    await useCase.call(NoParam());
    verify(
      mockCategoriesRepository.getCategories(),
    ).called(1);
  });

  test('GIVEN a successful response '
      'WHEN getCategories is called '
      'THEN it should return success', () async {
    when(
      mockCategoriesRepository.getCategories(),
    ).thenAnswer((_) async => const Result.ok([]));
    final result = await useCase.call(NoParam());
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'WHEN getCategories is called '
      'THEN it should return an error', () async {
    when(
      mockCategoriesRepository.getCategories(),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(NoParam());
    expect(result, isA<Error>());
  });
}
