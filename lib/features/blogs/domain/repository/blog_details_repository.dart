import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../../dashboard/domain/entity/category_list.dart';

abstract class BlogDetailsRepository {
  Future<Either<Failure, BlogItem>> getBlogDetails({required int blogId});
  Future<Either<Failure, List<BlogItem>>> getRecentPosts();
  Future<Either<Failure, List<BlogDetailsItem>>> getSections({
    required int blogId,
  });
  Future<Either<Failure, List<Category>>> getCategoryList();
}
