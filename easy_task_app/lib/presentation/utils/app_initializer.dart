import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/di/data_di.dart';
import '../../domain/di/domain_di.dart';
import '../di/presentation_di.dart';

abstract class AppInitializer {
  static Future<void> execute() async {
    await _initializeSupabase();
    await _initializeDependencies();
  }

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const apiKey = String.fromEnvironment('SUPABASE_API_KEY');

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
