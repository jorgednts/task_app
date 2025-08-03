import 'package:core/core.dart';
import 'package:easy_task_app/domain/use_case/categories/edit_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/categories_test_resources.dart';
import 'create_category_use_case_test.mocks.dart';

void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  late EditCategoryUseCase useCase;

  setUp(
    () {
      mockCategoriesRepository = MockCategoriesRepository();
      useCase = EditCategoryUseCase(
        categoriesRepository: mockCategoriesRepository,
      );
    },
  );

  provideDummy<Result<void>>(const Result.ok(null));

  test('GIVEN a call '
      'WHEN editCategory is called '
      'THEN it should call the repository once', () async {
    when(
      mockCategoriesRepository.updateCategory(params: editCategoryParams),
    ).thenAnswer((_) async => const Result.ok(null));
    await useCase(editCategoryParams);
    verify(
      mockCategoriesRepository.updateCategory(params: editCategoryParams),
    ).called(1);
  });

  test('GIVEN a successful response '
      'WHEN editCategory is called '
      'THEN it should return success', () async {
    when(
      mockCategoriesRepository.updateCategory(params: anyNamed('params')),
    ).thenAnswer((_) async => const Result.ok(null));
    final result = await useCase(editCategoryParams);
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'WHEN editCategory is called '
      'THEN it should return an error', () async {
    when(
      mockCategoriesRepository.updateCategory(params: anyNamed('params')),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase(editCategoryParams);
    expect(result, isA<Error>());
  });
}
