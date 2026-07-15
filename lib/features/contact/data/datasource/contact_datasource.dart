import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ContactDataSource {
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class ContactDataSourceImp implements ContactDataSource {
  SupabaseClient client;
  ContactDataSourceImp(this.client);
  @override
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final res = await client.functions.invoke(
      'resend-email',
      body: {
        'name': name,
        'from': email,
        'subject': subject,
        'message': message,
      },
    );

    return res.status == 200;
  }
}
