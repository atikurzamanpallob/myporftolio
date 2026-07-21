import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

abstract class CategoryRespository {
  Future<Either<Failure, List<Category>>> getCategoryList();
}
