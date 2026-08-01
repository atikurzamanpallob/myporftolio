import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';

abstract class CareerDatasource {
  Future<List<CertificationItem>> getCertificates();
  Future<List<WorkExperienceItem>> getExperiences();
}
