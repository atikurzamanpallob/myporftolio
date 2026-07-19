import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/data/datasource/blog_datasource.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_repository.dart';
import 'package:myportfolioapp/features/dashboard/data/datasource/category_datasource.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

class BlogRepositoryImpl extends BlogRepository {
  BlogDatasource datasource;
  CategoryDatasource categoryDatasource;
  BlogRepositoryImpl(this.datasource, this.categoryDatasource);

  @override
  Future<Either<Failure, List<BlogItem>>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  }) async {
    try {
      return Right(
        await datasource.getBlogs(
          page: page,
          limit: limit,
          categoryId: categoryId,
        ),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      return Right(await categoryDatasource.getCategoryList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
