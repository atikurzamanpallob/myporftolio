import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';

abstract class CareerRepository {
  Future<Either<Failure, List<CertificationItem>>> getCertificates();
}
