import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_details_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entity/category_list.dart';
import '../entity/blog_details_item.dart';
import '../entity/blog_item.dart';

class BlogDetailsData {
  BlogDetailsRepository repository;
  BlogDetailsData(this.repository);

  Future<Either<Failure, BlogItem>> getBlogDetails({
    required int blogId,
  }) async {
    return repository.getBlogDetails(blogId: blogId);
  }

  Future<Either<Failure, List<BlogItem>>> getRecentPosts() async {
    return repository.getRecentPosts();
  }

  Future<Either<Failure, List<BlogDetailsItem>>> getSections({
    required int blogId,
  }) async {
    return repository.getSections(blogId: blogId);
  }

  Future<Either<Failure, List<Category>>> getCategoryList() async {
    return repository.getCategoryList();
  }
}
