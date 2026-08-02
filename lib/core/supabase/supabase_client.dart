import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/load_variables.dart';

Future initSupabase() async {
  await Supabase.initialize(url: URL, publishableKey: PUBLIC_KEY);
}
