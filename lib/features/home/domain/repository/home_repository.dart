import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeInfo?>> getHomeInfo();
  Future<Either<Failure, List<ContactInfo>>> getContactInfo();
}
