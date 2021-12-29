import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/category/data/repositories/category_repository_impl.dart';
import 'package:my_ecommerce/models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

/// states::  LoadingCategoryState &&  LoadedCategoryState &&  ErrorCategoryState
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepositoryImpl _categoryRepository;
  StreamSubscription? categorySubscription;

  CategoryBloc({required CategoryRepositoryImpl categoryRepository})
      : _categoryRepository = categoryRepository,
        super(const LoadingCategoryState()) {
    on<UpdateCategoriesEvent>(_onUpdateCategoriesEvent);
    on<LoadCategoryEvent>(_onLoadCategoryEvent);
  }
  void _onUpdateCategoriesEvent(UpdateCategoriesEvent event, Emitter emit) {
    emit(LoadedCategoryState(categories: event.categories));
  }

  FutureOr<void> _onLoadCategoryEvent(
      LoadCategoryEvent event, Emitter emit) async {
    try {
      await categorySubscription?.cancel();
      categorySubscription = _categoryRepository.getAllCategories().listen(
            (List<Category> categories) => add(
              UpdateCategoriesEvent(categories: categories),
            ),
          );
    } catch (e) {
      log('error is:$e');
      emit(const ErrorCategoryState(
          failure: ServerFailure(
              detailedMsg: "cannot get the categories from the server")));
    }
  }
}
