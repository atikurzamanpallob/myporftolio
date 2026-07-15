import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';
import 'package:myportfolioapp/features/career/domain/repository/career_repository.dart';

class CareerData {
  CareerRepository repository;
  CareerData(this.repository);

  Future<Either<Failure, List<CertificationItem>>> getCertifcates() async {
    return repository.getCertificates();
  }

  Future<Either<Failure, List<WorkExperienceItem>>> getExperiences() async {
    return repository.getExperience();
  }
}
