import 'package:core/core.dart';
import 'package:easy_task_app/domain/use_case/categories/delete_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'create_category_use_case_test.mocks.dart';

void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  late DeleteCategoryUseCase useCase;

  setUp(
    () {
      mockCategoriesRepository = MockCategoriesRepository();
      useCase = DeleteCategoryUseCase(
        categoriesRepository: mockCategoriesRepository,
      );
    },
  );

  provideDummy<Result<void>>(const Result.ok(null));

  test('GIVEN a call '
      'THEN it should call the repository once', () async {
    when(
      mockCategoriesRepository.deleteCategory(categoryId: ''),
    ).thenAnswer((_) async => const Result.ok(null));
    await useCase.call('');
    verify(
      mockCategoriesRepository.deleteCategory(categoryId: ''),
    ).called(1);
  });

  test('GIVEN a successful response '
      'THEN it should return success', () async {
    when(
      mockCategoriesRepository.deleteCategory(categoryId: ''),
    ).thenAnswer((_) async => const Result.ok(null));
    final result = await useCase.call('');
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'THEN it should return an error', () async {
    when(
      mockCategoriesRepository.deleteCategory(categoryId: ''),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call('');
    expect(result, isA<Error>());
  });
}
