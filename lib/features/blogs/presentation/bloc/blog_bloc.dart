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
      state.copyWith(isBlogLoading: true, currentCategory: event.categoryId),
    );

    final result = await blogData.getBlogList(
      page: event.page,
      limit: event.limit,
      categoryId: event.categoryId == -1 ? null : event.categoryId,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isBlogLoading: false, error: failure.message));
      },
      (blogs) {
        emit(state.copyWith(isBlogLoading: false, blogs: blogs));
      },
    );
  }
}
