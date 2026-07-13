import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';

class GetHomeData {
  HomeRepository repository;
  GetHomeData(this.repository);

  Future<Either<HomeInfo?, Failure>> getHomeInfo() async {
    return await repository.getHomeInfo();
  }

  Future<Either<List<ContactInfo>?, Failure>> getContactInfo() async {
    return await repository.getContactInfo();
  }
}
