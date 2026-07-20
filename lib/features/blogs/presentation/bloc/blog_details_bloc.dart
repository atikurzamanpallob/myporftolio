import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_event.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_state.dart';

import '../../../dashboard/domain/entity/category_list.dart';
import '../../domain/usecase/blog_details_data.dart';

class BlogDetailsBloc extends Bloc<BlogEvent, BlogDetailsState> {
  BlogDetailsData blogDetailsData;

  BlogDetailsBloc(this.blogDetailsData) : super(BlogDetailsState()) {
    on<DetailsFetchEvent>(fetchDetails);
    on<SectionFetchEvent>(fetchSection);
    on<RecentPostFetchEvent>(fetchRecentPost);
    on<CategoryFetchEvent>(fetchCategory);
    add(CategoryFetchEvent());
    add(RecentPostFetchEvent());
  }

  Future<void> fetchDetails(
    DetailsFetchEvent event,
    Emitter<BlogDetailsState> emit,
  ) async {
    final result = await blogDetailsData.getBlogDetails(blogId: event.blogId);
    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (blog) {
        emit(state.copyWith(blog: blog));
      },
    );
  }

  Future<void> fetchSection(
    SectionFetchEvent event,
    Emitter<BlogDetailsState> emit,
  ) async {
    final result = await blogDetailsData.getSections(blogId: event.blogId);

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (sections) {
        emit(state.copyWith(sections: sections));
      },
    );
  }

  Future<void> fetchRecentPost(
    RecentPostFetchEvent event,
    Emitter<BlogDetailsState> emit,
  ) async {
    final result = await blogDetailsData.getRecentPosts();

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (items) {
        emit(state.copyWith(recentPosts: items));
      },
    );
  }

  Future<void> fetchCategory(
    CategoryFetchEvent event,
    Emitter<BlogDetailsState> emit,
  ) async {
    final result = await blogDetailsData.getCategoryList();

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (categories) {
        List<Category> catList = [Category(name: "All", id: -1), ...categories];
        emit(state.copyWith(category: catList));
      },
    );
  }
}
