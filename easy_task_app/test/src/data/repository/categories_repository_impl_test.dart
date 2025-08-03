import 'package:core/core.dart';
import 'package:easy_task_app/data/remote/data_source/categories/categories_remote_data_source.dart';
import 'package:easy_task_app/data/repository/categories_repository_impl.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_color.dart';
import 'package:easy_task_app/domain/model/tasks/easy_task_category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/categories_test_resources.dart';
import 'categories_repository_impl_test.mocks.dart';

@GenerateMocks([CategoriesRemoteDataSource, NetworkService])
void main() {
  late MockCategoriesRemoteDataSource mockDataSource;
  late MockNetworkService mockNetworkService;
  late CategoriesRepositoryImpl repository;

  provideDummy<Result<List<EasyTaskCategoryModel>>>(
    const Result.ok(<EasyTaskCategoryModel>[]),
  );
  provideDummy<Result<void>>(const Result.ok(null));

  setUp(() {
    mockDataSource = MockCategoriesRemoteDataSource();
    mockNetworkService = MockNetworkService();
    repository = CategoriesRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkService: mockNetworkService,
    );
    when(
      mockNetworkService.checkInternetConnection(),
    ).thenAnswer((_) async => true);
  });

  group('getCategories', () {
    test('GIVEN a call '
        'WHEN getCategories is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.getCategories(),
      ).thenAnswer((_) async => mockCategoriesResponse);

      await repository.getCategories();
      verify(mockDataSource.getCategories()).called(1);
    });

    test('GIVEN a successful response '
        'WHEN getCategories is called '
        'THEN it should return list of EasyTaskCategoryModel', () async {
      when(
        mockDataSource.getCategories(),
      ).thenAnswer((_) async => mockCategoriesResponse);

      final result = await repository.getCategories();
      expect(result, isA<Ok<List<EasyTaskCategoryModel>>>());

      result.fold(
        onOk: (categories) {
          expect(categories.length, 2);
          expect(categories[0].name, 'Work');
          expect(categories[0].color, EasyTaskCategoryColorModel.categoryBlue);
          expect(categories[1].name, 'Personal');
          expect(categories[1].color, EasyTaskCategoryColorModel.categoryRed);
        },
        onError: (_) => fail('Should not return error'),
      );
    });

    test('GIVEN a failure '
        'WHEN getCategories is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.getCategories(),
      ).thenThrow(Exception('Get categories failed'));

      final result = await repository.getCategories();
      expect(result, isA<Error>());
    });
  });

  group('createCategory', () {
    test('GIVEN a call '
        'WHEN createCategory is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.createCategory(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      await repository.createCategory(params: createCategoryParams);
      verify(
        mockDataSource.createCategory(params: createCategoryParams.toQuery()),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN createCategory is called '
        'THEN it should return success', () async {
      when(
        mockDataSource.createCategory(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      final result = await repository.createCategory(params: createCategoryParams);
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN createCategory is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.createCategory(params: anyNamed('params')),
      ).thenThrow(Exception('Create category failed'));

      final result = await repository.createCategory(params: createCategoryParams);
      expect(result, isA<Error>());
    });
  });

  group('updateCategory', () {
    test('GIVEN a call '
        'WHEN updateCategory is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.updateCategory(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      await repository.updateCategory(params: editCategoryParams);
      verify(
        mockDataSource.updateCategory(params: editCategoryParams.toQuery()),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN updateCategory is called '
        'THEN it should return success', () async {
      when(
        mockDataSource.updateCategory(params: anyNamed('params')),
      ).thenAnswer((_) async {});

      final result = await repository.updateCategory(params: editCategoryParams);
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN updateCategory is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.updateCategory(params: anyNamed('params')),
      ).thenThrow(Exception('Update category failed'));

      final result = await repository.updateCategory(params: editCategoryParams);
      expect(result, isA<Error>());
    });
  });

  group('deleteCategory', () {
    const categoryId = 'category123';

    test('GIVEN a call '
        'WHEN deleteCategory is called '
        'THEN it should call the data source once', () async {
      when(
        mockDataSource.deleteCategory(categoryId: anyNamed('categoryId')),
      ).thenAnswer((_) async {});

      await repository.deleteCategory(categoryId: categoryId);
      verify(
        mockDataSource.deleteCategory(categoryId: categoryId),
      ).called(1);
    });

    test('GIVEN a successful response '
        'WHEN deleteCategory is called '
        'THEN it should return success', () async {
      when(
        mockDataSource.deleteCategory(categoryId: anyNamed('categoryId')),
      ).thenAnswer((_) async {});

      final result = await repository.deleteCategory(categoryId: categoryId);
      expect(result, isA<Ok<void>>());
    });

    test('GIVEN a failure '
        'WHEN deleteCategory is called '
        'THEN it should return an error', () async {
      when(
        mockDataSource.deleteCategory(categoryId: anyNamed('categoryId')),
      ).thenThrow(Exception('Delete category failed'));

      final result = await repository.deleteCategory(categoryId: categoryId);
      expect(result, isA<Error>());
    });
  });
}
