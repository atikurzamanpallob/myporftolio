import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/career/data/datasources/career_datasource.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/repository/career_repository.dart';

class CareerRepositoryImpl implements CareerRepository {
  CareerDatasource datasource;
  CareerRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<CertificationItem>>> getCertificates() async {
    try {
      return Right(await datasource.getCertificates());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
