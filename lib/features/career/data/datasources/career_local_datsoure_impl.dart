import 'package:hive/hive.dart';
import '../../domain/entity/certificate_item.dart';
import '../../domain/entity/work_experience_item.dart';
import '../models/certificate_item_model.dart';
import '../models/work_experience_item_model.dart';
import 'career_datasource.dart';

class CareerLocalDatasourceImp implements CareerDatasource {
  Box box;
  CareerLocalDatasourceImp(this.box);
  @override
  Future<List<CertificationItem>> getCertificates() async {
    List<CertificationItem> certificates = [];
    var response = box.get("certifications", defaultValue: []);
    for (var v in response) {
      final model = CertificateItemModel.fromJson(v);
      certificates.add(model.toEntity());
    }
    return certificates;
  }

  @override
  Future<List<WorkExperienceItem>> getExperiences() async {
    List<WorkExperienceItem> experience = [];
    var response = box.get("experience", defaultValue: []);
    for (var v in response) {
      final model = WorkExperienceItemModel.fromJson(v);

      experience.add(model.toEntity());
    }
    return experience;
  }
}
