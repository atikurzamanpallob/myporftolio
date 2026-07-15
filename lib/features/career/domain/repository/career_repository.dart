import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';

abstract class CareerRepository {
  Future<Either<Failure, List<CertificationItem>>> getCertificates();
  Future<Either<Failure, List<WorkExperienceItem>>> getExperience();
}
