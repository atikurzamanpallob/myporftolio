import 'package:hive/hive.dart';
import '../../../../core/utils/time_formatter.dart';
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
    var ob = box.get(
      "certifications",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var v in ob["response"]) {
        final model = CertificateItemModel.fromJson(v);
        certificates.add(model.toEntity());
      }
      return certificates;
    }
  }

  @override
  Future<List<WorkExperienceItem>> getExperiences() async {
    List<WorkExperienceItem> experience = [];
    var ob = box.get(
      "experience",
      defaultValue: {"timestamp": null, "response": []},
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var v in ob["response"]) {
        final model = WorkExperienceItemModel.fromJson(v);
        experience.add(model.toEntity());
      }
      return experience;
    }
  }
}
