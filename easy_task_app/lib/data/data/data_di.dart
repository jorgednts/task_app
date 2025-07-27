import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repository/auth_repository.dart';
import '../remote/data_source/auth/auth_remote_data_source.dart';
import '../remote/data_source/auth/auth_remote_data_source_impl.dart';
import '../repository/auth_repository_impl.dart';

abstract class DataDI {
  static void getIt() {
    final getIt = GetIt.instance;
    getIt
      ..registerSingleton<LoggerService>(
        LoggerServiceImpl(),
      )
      ..registerSingleton<AuthRemoteDataSource>(
        AuthRemoteDataSourceImpl(
          supabaseClient: Supabase.instance.client,
          logger: getIt.get<LoggerService>(),
        ),
      )
      ..registerSingleton<AuthRepository>(
        AuthRepositoryImpl(
          remoteDataSource: getIt.get<AuthRemoteDataSource>(),
        ),
      );
  }
}
