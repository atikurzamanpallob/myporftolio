import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

abstract class HomeRepository {
  Future<Either<HomeInfo?, Failure>> getHomeInfo();
  Future<Either<List<ContactInfo>, Failure>> getContactInfo();
}
