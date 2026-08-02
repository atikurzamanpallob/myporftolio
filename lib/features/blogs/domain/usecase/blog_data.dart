import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_repository.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

import '../entity/blog_section_item.dart';

class BlogData {
  BlogRepository repository;
  BlogData(this.repository);

  Future<Either<Failure, List<BlogItem>>> getBlogList({
    int page = 0,
    int limit = 10,
    int? categoryId,
  }) async {
    return repository.getBlogs(
      page: page,
      limit: limit,
      categoryId: categoryId,
    );
  }

  Future<Either<Failure, List<Category>>> getCategories() async {
    return repository.getCategoryList();
  }

  Future<Either<Failure, bool>> addBlog(BlogAddItem item) async {
    return repository.addBlog(item: item);
  }

  Future<Either<Failure, BlogItem?>> getBlogDetails({
    required int blogId,
  }) async {
    return repository.getBlogDetails(blogId: blogId);
  }

  Future<Either<Failure, List<BlogItem>>> getRecentPosts() async {
    return repository.getRecentPosts();
  }

  Future<Either<Failure, List<BlogSectionItem>>> getSections({
    required int blogId,
  }) async {
    return repository.getSections(blogId: blogId);
  }
}
