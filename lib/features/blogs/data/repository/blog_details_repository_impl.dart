import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/data/datasource/blog_details_datasource.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_details_repository.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

import '../../../dashboard/data/datasource/category_datasource.dart';

class BlogDetailsRepositoryImpl extends BlogDetailsRepository {
  BlogDetailsDatasource datasource;
  CategoryDatasource categoryDatasource;
  BlogDetailsRepositoryImpl(this.datasource, this.categoryDatasource);
  @override
  Future<Either<Failure, BlogItem>> getBlogDetails({
    required int blogId,
  }) async {
    try {
      return Right(await datasource.getBlogDetails(blogId: blogId));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BlogItem>>> getRecentPosts() async {
    try {
      return Right(await datasource.getRecentPosts());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BlogDetailsItem>>> getSections({
    required int blogId,
  }) async {
    try {
      return Right(await datasource.getSections(blogId: blogId));
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
