import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

abstract class BlogRepository {
  Future<Either<Failure, List<Category>>> getCategoryList();
  Future<Either<Failure, List<BlogItem>>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  });
}
