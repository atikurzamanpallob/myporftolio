import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/career/data/datasources/career_datasource.dart';
import 'package:myportfolioapp/features/career/domain/entity/certificate_item.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';
import 'package:myportfolioapp/features/career/domain/repository/career_repository.dart';

class CareerRepositoryImpl implements CareerRepository {
  CareerDatasource remote, local;
  CareerRepositoryImpl(this.remote, this.local);
  @override
  Future<Either<Failure, List<CertificationItem>>> getCertificates() async {
    try {
      List<CertificationItem> list = await local.getCertificates();
      if (list.isEmpty) {
        return Right(await remote.getCertificates());
      } else {
        return Right(list);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkExperienceItem>>> getExperience() async {
    try {
      List<WorkExperienceItem> list = await local.getExperiences();
      if (list.isEmpty) {
        return Right(await remote.getExperiences());
      } else {
        return Right(await local.getExperiences());
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
