import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://rapbhkvgkjmcmlbamwlz.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhcGJoa3Zna2ptY21sYmFtd2x6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MTg3MDEsImV4cCI6MjA4NTA5NDcwMX0.-As03t6TV508OP0WXE_kc8iwLSPSIF578xETBacBlqw';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        headers: {'X-Client-Info': 'flutterflow'},
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
