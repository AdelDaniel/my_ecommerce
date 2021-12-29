part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class LoadingCategoryState extends CategoryState {
  const LoadingCategoryState();

  @override
  List<Object?> get props => [];
}

class LoadedCategoryState extends CategoryState {
  const LoadedCategoryState({this.categories = const <Category>[]});
  final List<Category> categories;

  @override
  List<Object?> get props => [categories, categories.length];
}

class ErrorCategoryState extends CategoryState {
  const ErrorCategoryState({required this.failure});
  final Failure failure;
  @override
  List<Object?> get props => [failure];
}
