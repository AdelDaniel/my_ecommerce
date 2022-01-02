import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:my_ecommerce/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

/// events::  LoadProductEvent & UpdateProductsEvent & AddProductEvent
/// states::  LoadingProductState &&  LoadedProductState &&  ErrorProductState
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const LoadingProductState()) {
    on<LoadProductEvent>(_onLoadProductEvent);
    on<UpdateProductsEvent>(_onUpdateProductsEvent);
    on<AddProductEvent>(_onAddProductEvent);
  }

  void _onUpdateProductsEvent(UpdateProductsEvent event, Emitter emit) {
    emit(LoadedProductState(products: event.products));
  }

  FutureOr<void> _onLoadProductEvent(
      LoadProductEvent event, Emitter emit) async {
    try {
      await productSubscription?.cancel();
      productSubscription = _productRepository.getAllProducts().listen(
            (List<Product> products) => add(
              UpdateProductsEvent(products: products),
            ),
          );
    } catch (e) {
      log('error is:$e');
      emit(const ErrorProductState(
          failure: ServerFailure(
              detailedMsg: "cannot get the Products from the server")));
    }
  }

  FutureOr<void> _onAddProductEvent(AddProductEvent event, Emitter emit) async {
    try {} catch (e) {
      log('error is:$e');
      emit(const ErrorProductState(
          failure: ServerFailure(
              detailedMsg: "cannot Save the Products from the server")));
    }
  }
}
