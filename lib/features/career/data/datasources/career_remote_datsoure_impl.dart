import 'package:hive/hive.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/certificate_item.dart';
import '../../domain/entity/work_experience_item.dart';
import '../models/certificate_item_model.dart';
import '../models/work_experience_item_model.dart';
import 'career_datasource.dart';

class CareerRemoteDatasourceImp implements CareerDatasource {
  SupabaseClient client;
  Box box;
  CareerRemoteDatasourceImp(this.client, this.box);
  @override
  Future<List<CertificationItem>> getCertificates() async {
    List<CertificationItem> certificates = [];
    var response = await client.from('certification').select();
    box.put("certifications", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });
    for (var v in response) {
      final model = CertificateItemModel.fromJson(v);
      certificates.add(model.toEntity());
    }
    return certificates;
  }

  @override
  Future<List<WorkExperienceItem>> getExperiences() async {
    List<WorkExperienceItem> experience = [];
    var response = await client
        .from('experience')
        .select()
        .order('id', ascending: false);
    box.put("experience", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });
    for (var v in response) {
      final model = WorkExperienceItemModel.fromJson(v);

      experience.add(model.toEntity());
    }
    return experience;
  }
}
