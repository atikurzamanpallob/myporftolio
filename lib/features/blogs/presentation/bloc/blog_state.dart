// ignore_for_file: must_be_immutable
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../../dashboard/domain/entity/category_list.dart';

class BlogState {
  final bool isCategoryLoading;
  final bool isBlogLoading;
  final bool isLoadMoreLoading;
  final List<Category>? category;
  final List<BlogItem> blogs;
  final int currentCategory;
  final int currentPage;
  final bool hasReachedMax;
  final String? error;

  BlogState({
    this.isCategoryLoading = false,
    this.isBlogLoading = false,
    this.isLoadMoreLoading = false,
    this.category,
    this.blogs = const [],
    this.currentCategory = -1,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.error,
  });

  BlogState copyWith({
    bool? isCategoryLoading,
    bool? isBlogLoading,
    bool? isLoadMoreLoading,
    List<Category>? category,
    List<BlogItem>? blogs,
    List<BlogDetailsItem>? blogSections,
    int? currentCategory,
    int? currentPage,
    bool? hasReachedMax,
    String? error,
  }) {
    return BlogState(
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      isBlogLoading: isBlogLoading ?? this.isBlogLoading,
      isLoadMoreLoading: isLoadMoreLoading ?? this.isLoadMoreLoading,
      category: category ?? this.category,
      blogs: blogs ?? this.blogs,
      currentCategory: currentCategory ?? this.currentCategory,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }
}

class BlogDetailsState {
  final List<Category>? category;
  final BlogItem? blog;
  final List<BlogItem>? recentPosts;
  final List<BlogDetailsItem>? sections;
  final String? error;

  BlogDetailsState({
    this.category,
    this.recentPosts,
    this.sections,
    this.blog,
    this.error,
  });

  BlogDetailsState copyWith({
    List<Category>? category,
    BlogItem? blog,
    List<BlogItem>? recentPosts,
    List<BlogDetailsItem>? sections,
    String? error,
  }) {
    return BlogDetailsState(
      category: category ?? this.category,
      blog: blog ?? this.blog,
      recentPosts: recentPosts ?? this.recentPosts,
      sections: sections ?? this.sections,
      error: error ?? this.error,
    );
  }
}
