import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/blogs/domain/usecase/blog_data.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_event.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_state.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogData blogData;
  BlogBloc(this.blogData) : super(BlogState()) {
    on<CategoryFetchEvent>(fetchCategory);
    on<BlogFetchEvent>(fetchBlogs);
    on<LoadMoreBlogEvent>(loadMoreBlogs); // NEW
    add(CategoryFetchEvent());
  }

  Future fetchCategory(
    CategoryFetchEvent event,
    Emitter<BlogState> emit,
  ) async {
    emit(state.copyWith(isCategoryLoading: true));

    final result = await blogData.getCategories();

    result.fold(
      (failure) {
        emit(state.copyWith(isCategoryLoading: false, error: failure.message));
      },
      (categories) {
        List<Category> catList = [Category(name: "All", id: -1), ...categories];
        emit(state.copyWith(isCategoryLoading: false, category: catList));
      },
    );
  }

  Future fetchBlogs(BlogFetchEvent event, Emitter<BlogState> emit) async {
    emit(
      state.copyWith(
        isBlogLoading: true,
        currentCategory: event.categoryId,
        currentPage: 1,
        hasReachedMax: false,
      ),
    );

    final result = await blogData.getBlogList(
      page: 1,
      limit: event.limit,
      categoryId: event.categoryId == -1 ? null : event.categoryId,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isBlogLoading: false, error: failure.message));
      },
      (blogs) {
        emit(
          state.copyWith(
            isBlogLoading: false,
            blogs: blogs,
            currentPage: 1,
            hasReachedMax: blogs.length < event.limit,
          ),
        );
      },
    );
  }

  Future loadMoreBlogs(LoadMoreBlogEvent event, Emitter<BlogState> emit) async {
    if (state.hasReachedMax || state.isLoadMoreLoading) return;

    emit(state.copyWith(isLoadMoreLoading: true));

    final nextPage = state.currentPage + 1;

    final result = await blogData.getBlogList(
      page: nextPage,
      limit: event.limit,
      categoryId: state.currentCategory == -1 ? null : state.currentCategory,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoadMoreLoading: false, error: failure.message));
      },
      (newBlogs) {
        emit(
          state.copyWith(
            isLoadMoreLoading: false,
            blogs: [...state.blogs, ...newBlogs],
            currentPage: nextPage,
            hasReachedMax: newBlogs.length < event.limit,
          ),
        );
      },
    );
  }
}
