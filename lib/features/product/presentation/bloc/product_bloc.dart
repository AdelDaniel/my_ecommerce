import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:my_ecommerce/features/wish_list/presentation/bloc/wishlist_bloc.dart';
import 'package:my_ecommerce/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

/// events::  LoadProductEvent & UpdateProductsEvent & AddProductEvent
/// states::  LoadingProductState &&  LoadedProductState &&  ErrorProductState
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  final WishlistBloc _wishlistBloc;
  StreamSubscription? productSubscription;

  ProductBloc({
    required ProductRepository productRepository,
    required WishlistBloc wishlistBloc,
  })  : _productRepository = productRepository,
        _wishlistBloc = wishlistBloc,
        super(const LoadingProductState()) {
    //TODO ::
    _wishlistBloc.stream.listen((WishlistState wishListState) {
      if (wishListState is LoadedWishListIdsState) {
        if (state is LoadedProductState) {
          log("wishListState is LoadedWishListIdsState)  ");
          add(
            UpdateProductsEvent(
              products: (state as LoadedProductState).products,
            ),
          );
        }
      }
    });
    on<LoadProductEvent>(_onLoadProductEvent);
    on<UpdateProductsEvent>(_onUpdateProductsEvent);
    on<AddProductEvent>(_onAddProductEvent);
  }

  void _onUpdateProductsEvent(UpdateProductsEvent event, Emitter emit) {
    final List<Product> updatedProducts = [];
    if (_wishlistBloc.state is LoadedWishListIdsState) {
      final loadedWishListIds = _wishlistBloc.state as LoadedWishListIdsState;
      for (final product in event.products) {
        if (loadedWishListIds.ids.contains(product.id)) {
          updatedProducts.add(product.copyWith(isWishListed: true));
        } else if (!loadedWishListIds.ids.contains(product.id)) {
          updatedProducts.add(product.copyWith(isWishListed: false));
        }
      }
      emit(LoadedProductState(products: updatedProducts));
    } else if (_wishlistBloc.state is EmptyWishListState) {
      for (final product in event.products) {
        updatedProducts.add(product.copyWith(isWishListed: false));
      }

      emit(LoadedProductState(products: updatedProducts));
    } else {
      emit(LoadedProductState(products: event.products));
    }
  }

  // this is  called only in first time and when new data added from the server
  FutureOr<void> _onLoadProductEvent(
    LoadProductEvent event,
    Emitter emit,
  ) async {
    try {
      await productSubscription?.cancel();
      productSubscription =
          _productRepository.getAllProducts().listen((List<Product> products) {
        add(UpdateProductsEvent(products: products));
      });
    } catch (e) {
      emit(
        const ErrorProductState(
          failure: ServerFailure(
            detailedMsg: "cannot get the Products from the server",
          ),
        ),
      );
    }
  }

  void productAddedToWishList(Product product) =>
      _wishListUpdated(product, true);

  void productRemovedFromWishList(Product product) =>
      _wishListUpdated(product, false);

  void _wishListUpdated(Product product, bool value) {
    if (state is LoadedProductState) {
      final List<Product> allProducts = (state as LoadedProductState).products;
      final int productIndexInList = allProducts.indexOf(product);
      final Product updatedProduct = allProducts
          .removeAt(productIndexInList)
          .copyWith(isWishListed: value);
      allProducts.insert(productIndexInList, updatedProduct);
      add(UpdateProductsEvent(products: allProducts));
    }
  }

//TODO add new product
  FutureOr<void> _onAddProductEvent(AddProductEvent event, Emitter emit) async {
    try {} catch (e) {
      log('error is:$e');
      emit(const ErrorProductState(
          failure: ServerFailure(
              detailedMsg: "cannot Save the Products from the server")));
    }
  }
}
