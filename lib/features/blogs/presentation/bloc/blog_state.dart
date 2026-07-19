// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../../dashboard/domain/entity/category_list.dart';

class BlogState extends Equatable {
  bool? isCategoryLoading;
  List<Category>? category;
  bool? isBlogLoading;
  List<BlogItem>? blogs;
  int? currentCategory;
  String? error;
  BlogState({
    this.category,
    this.isCategoryLoading,
    this.blogs,
    this.isBlogLoading,
    this.currentCategory,
    this.error,
  });

  BlogState copyWith({
    bool? isCategoryLoading,
    List<Category>? category,
    bool? isBlogLoading,
    List<BlogItem>? blogs,
    int? currentCategory,
    String? error,
  }) {
    return BlogState(
      category: category ?? this.category,
      blogs: blogs ?? this.blogs,
      isBlogLoading: isBlogLoading ?? this.isBlogLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      currentCategory: currentCategory ?? this.currentCategory,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    isCategoryLoading,
    category,
    isBlogLoading,
    blogs,
    currentCategory,
    error,
  ];
}
