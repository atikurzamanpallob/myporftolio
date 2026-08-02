import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/data/datasource/blog_datasource.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_repository.dart';
import 'package:myportfolioapp/features/dashboard/data/datasource/category_datasource.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

class BlogRepositoryImpl extends BlogRepository {
  BlogRemoteDatasource remote;
  BlogLocalDatasource local;
  CategoryDatasource catRemote, catLocal;
  BlogRepositoryImpl(this.remote, this.local, this.catRemote, this.catLocal);

  @override
  Future<Either<Failure, List<BlogItem>>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  }) async {
    try {
      List<BlogItem> list = await local.getBlogs(page: page, limit: limit);
      if (list.isNotEmpty) {
        return Right(list);
      } else {
        return Right(
          await remote.getBlogs(
            page: page,
            limit: limit,
            categoryId: categoryId,
          ),
        );
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      List<Category> list = await catLocal.getCategoryList();
      if (list.isNotEmpty) {
        return Right(list);
      } else {
        return Right(await catRemote.getCategoryList());
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addBlog({required BlogAddItem item}) async {
    try {
      return Right(await remote.addBlogs(item: item));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
