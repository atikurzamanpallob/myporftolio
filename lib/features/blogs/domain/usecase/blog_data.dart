import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/domain/repository/blog_repository.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

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
}
