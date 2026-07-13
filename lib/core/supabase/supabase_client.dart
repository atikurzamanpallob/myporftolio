import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future initSupabase() async {
  await Supabase.initialize(
    url: dotenv.get("URL"),
    publishableKey: dotenv.get("PUBLIC_KEY"),
  );
}
