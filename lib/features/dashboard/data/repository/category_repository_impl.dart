import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/data/datasource/category_datasource.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/dashboard/domain/repository/category_respository.dart';

class CategoryRepositoryImpl extends CategoryRespository {
  CategoryDatasource remote, local;
  CategoryRepositoryImpl(this.remote, this.local);
  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      List<Category> list = await local.getCategoryList();

      if (list.isNotEmpty) {
        return Right(list);
      } else {
        return Right(await remote.getCategoryList());
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
