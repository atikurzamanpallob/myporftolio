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
  Future<Either<List<ContactInfo>, Failure>> getContactInfo() async {
    try {
      return Left(await datasource.getContactInfo());
    } catch (e) {
      return Right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<HomeInfo?, Failure>> getHomeInfo() async {
    try {
      return Left(await datasource.getHomeInfo());
    } catch (e) {
      return Right(Failure(e.toString()));
    }
  }
}
