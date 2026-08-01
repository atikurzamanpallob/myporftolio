import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/home/data/datasource/home_datasource.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeDatasource remote, local;
  HomeRepositoryImp(this.remote, this.local);
  @override
  Future<Either<Failure, List<ContactInfo>>> getContactInfo() async {
    try {
      List<ContactInfo> list = await local.getContactInfo();
      if (list.isEmpty) {
        return Right(await remote.getContactInfo());
      } else {
        return Right(list);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeInfo?>> getHomeInfo() async {
    try {
      var homeInfo = await local.getHomeInfo();
      if (homeInfo == null) {
        return Right(await remote.getHomeInfo());
      } else {
        return Right(homeInfo);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
