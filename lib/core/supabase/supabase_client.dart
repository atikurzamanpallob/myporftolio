// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late String URL;
late String PUBLIC_KEY;
late String USER_NAME;
late String USER_PASS;
late String STORAGE_URL;

Future initSupabase() async {
  URL = const String.fromEnvironment('URL', defaultValue: '');
  PUBLIC_KEY = const String.fromEnvironment('PUBLIC_KEY', defaultValue: '');
  USER_NAME = const String.fromEnvironment('USER_NAME', defaultValue: '');
  USER_PASS = const String.fromEnvironment('USER_PASS', defaultValue: '');
  STORAGE_URL = const String.fromEnvironment('STORAGE_URL', defaultValue: '');

  if (kDebugMode) {
    await dotenv.load();
    URL = dotenv.get("URL");
    PUBLIC_KEY = dotenv.get("PUBLIC_KEY");
    USER_NAME = dotenv.get("USER_NAME");
    USER_PASS = dotenv.get("USER_PASS");
    STORAGE_URL = dotenv.get("STORAGE_URL");
  }
  await Supabase.initialize(url: URL, publishableKey: PUBLIC_KEY);
}
