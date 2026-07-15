// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/career/data/models/certificate_item_model.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CareerDatasource {
  Future<List<CertificationItem>> getCertificates();
}

class CareerDatasourceImp implements CareerDatasource {
  SupabaseClient client;
  CareerDatasourceImp(this.client);
  @override
  Future<List<CertificationItem>> getCertificates() async {
    List<CertificationItem> certificates = [];
    var response = await client.from('certification').select();
    response.forEach((v) {
      final model = CertificateItemModel.fromJson(v);
      certificates.add(model.toEntity());
    });
    return certificates;
  }
}
