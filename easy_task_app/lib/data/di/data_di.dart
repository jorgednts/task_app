import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repository/app_local_repository.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/categories_repository.dart';
import '../../domain/repository/tasks_repository.dart';
import '../local/data_source/app_local_data_source.dart';
import '../local/data_source/app_local_data_source_impl.dart';
import '../remote/data_source/auth/auth_remote_data_source.dart';
import '../remote/data_source/auth/auth_remote_data_source_impl.dart';
import '../remote/data_source/categories/categories_remote_data_source.dart';
import '../remote/data_source/categories/categories_remote_data_source_impl.dart';
import '../remote/data_source/tasks/tasks_remote_data_source.dart';
import '../remote/data_source/tasks/tasks_remote_data_source_impl.dart';
import '../repository/app_local_repository_impl.dart';
import '../repository/auth_repository_impl.dart';
import '../repository/categories_repository_impl.dart';
import '../repository/tasks_repository_impl.dart';

abstract class DataDI {
  static Future<void> getIt() async {
    final getIt = GetIt.instance;
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt
      ..registerSingleton<LoggerService>(
        LoggerServiceImpl(),
      )
      ..registerSingleton<NetworkService>(
        NetworkServiceImpl(),
      )
      ..registerSingleton<AppLocalDataSource>(
        AppLocalDataSourceImpl(
          sharedPreferences: sharedPreferences,
        ),
      )
      ..registerSingleton<AuthRemoteDataSource>(
        AuthRemoteDataSourceImpl(
          supabaseClient: Supabase.instance.client,
          logger: getIt.get<LoggerService>(),
        ),
      )
      ..registerSingleton<TasksRemoteDataSource>(
        TasksRemoteDataSourceImpl(
          supabaseClient: Supabase.instance.client,
          logger: getIt.get<LoggerService>(),
        ),
      )
      ..registerSingleton<CategoriesRemoteDataSource>(
        CategoriesRemoteDataSourceImpl(
          supabaseClient: Supabase.instance.client,
          logger: getIt.get<LoggerService>(),
        ),
      )
      ..registerSingleton<AppLocalRepository>(
        AppLocalRepositoryImpl(
          appLocalDataSource: getIt.get<AppLocalDataSource>(),
        ),
      )
      ..registerSingleton<AuthRepository>(
        AuthRepositoryImpl(
          remoteDataSource: getIt.get<AuthRemoteDataSource>(),
          networkService: getIt.get<NetworkService>(),
        ),
      )
      ..registerSingleton<TasksRepository>(
        TasksRepositoryImpl(
          remoteDataSource: getIt.get<TasksRemoteDataSource>(),
          networkService: getIt.get<NetworkService>(),
        ),
      )
      ..registerSingleton<CategoriesRepository>(
        CategoriesRepositoryImpl(
          remoteDataSource: getIt.get<CategoriesRemoteDataSource>(),
          networkService: getIt.get<NetworkService>(),
        ),
      );
  }
}
