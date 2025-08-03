import 'package:core/core.dart';
import 'package:easy_task_app/domain/repository/categories_repository.dart';
import 'package:easy_task_app/domain/use_case/categories/create_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../resources/categories_test_resources.dart';
import 'create_category_use_case_test.mocks.dart';

@GenerateMocks([CategoriesRepository])
void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  late CreateCategoryUseCase useCase;

  setUp(
    () {
      mockCategoriesRepository = MockCategoriesRepository();
      useCase = CreateCategoryUseCase(
        categoriesRepository: mockCategoriesRepository,
      );
    },
  );

  provideDummy<Result<void>>(const Result.ok(null));

  test('GIVEN a call '
      'WHEN createCategory is called '
      'THEN it should call the repository once', () async {
    when(
      mockCategoriesRepository.createCategory(params: createCategoryParams),
    ).thenAnswer((_) async => const Result.ok(null));
    await useCase.call(createCategoryParams);
    verify(
      mockCategoriesRepository.createCategory(params: createCategoryParams),
    ).called(1);
  });

  test('GIVEN a successful response '
      'WHEN createCategory is called '
      'THEN it should return success', () async {
    when(
      mockCategoriesRepository.createCategory(params: anyNamed('params')),
    ).thenAnswer((_) async => const Result.ok(null));
    final result = await useCase.call(createCategoryParams);
    expect(result, isA<Result<void>>());
  });

  test('GIVEN a failure '
      'WHEN createCategory is called '
      'THEN it should return an error', () async {
    when(
      mockCategoriesRepository.createCategory(params: anyNamed('params')),
    ).thenAnswer(
      (_) async => const Result.error(GenericException(message: 'Error')),
    );
    final result = await useCase.call(createCategoryParams);
    expect(result, isA<Error>());
  });
}
