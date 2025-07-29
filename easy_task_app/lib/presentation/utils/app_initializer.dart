import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/di/data_di.dart';
import '../../domain/di/domain_di.dart';
import '../di/presentation_di.dart';

abstract class AppInitializer {
  static Future<void> execute() async {
    await _initializeSupabase();
    await _initializeDependencies();
  }

  static const supabaseUrl = 'https://nzjojzchnyihkehntoxw.supabase.co';
  static const apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im56am9qemNobnlpaGtlaG50b3h3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM1MjM3MjYsImV4cCI6MjA2OTA5OTcyNn0.Ned5voI11QDLjinkMgw00Gb3jMi731_cXr_IBAmkdCs';

  static Future<void> _initializeSupabase() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: apiKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
      storageOptions: const StorageClientOptions(),
    );
  }

  static Future<void> _initializeDependencies() async {
    await DataDI.getIt();
    DomainDI.getIt();
    PresentationDI.getIt();
  }
}
