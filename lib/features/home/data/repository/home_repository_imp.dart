import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeDatasource datasource;
  HomeRepositoryImp(this.datasource);
  @override
  Future<Either<Failure, List<ContactInfo>>> getContactInfo() async {
    try {
      return Right(await datasource.getContactInfo());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeInfo?>> getHomeInfo() async {
    try {
      return Right(await datasource.getHomeInfo());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
