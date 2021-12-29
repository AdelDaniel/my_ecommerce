part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoryEvent extends CategoryEvent {
  const LoadCategoryEvent();
}

class UpdateCategoriesEvent extends CategoryEvent {
  const UpdateCategoriesEvent({required this.categories});
  final List<Category> categories;
}
