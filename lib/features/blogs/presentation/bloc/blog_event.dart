// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class BlogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryFetchEvent extends BlogEvent {}

class BlogFetchEvent extends BlogEvent {
  int page;
  int limit;
  int? categoryId;
  BlogFetchEvent({this.page = 1, this.limit = 10, this.categoryId});
  BlogEvent copyWith({int? page, int? limit, int? categoryId}) {
    return BlogFetchEvent(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  List<Object?> get props => [page, limit, categoryId];
}
