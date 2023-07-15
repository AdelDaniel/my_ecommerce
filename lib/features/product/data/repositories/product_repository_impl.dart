import 'dart:async';
import 'dart:developer';

import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/product/data/datasources/product_firebase_data_source.dart';
import 'package:my_ecommerce/features/product/domain/repositories/abstract_product_repository.dart';
import 'package:my_ecommerce/features/wish_list/presentation/bloc/wishlist_bloc.dart';

import 'package:my_ecommerce/models/models.dart';

class ProductRepository extends AbstractProductRepository {
  final ProductFirebaseDataSource _productFirebaseDataSource;
  final WishlistBloc _wishlistBloc;
  const ProductRepository({
    required ProductFirebaseDataSource productFirebaseDataSource,
    required WishlistBloc wishlistBloc,
  })  : _wishlistBloc = wishlistBloc,
        _productFirebaseDataSource = productFirebaseDataSource;
  @override
  Stream<List<Product>> getAllProducts() {
    return _productFirebaseDataSource
        .getAllProducts()
        .transform(StreamTransformer<List<Product>, List<Product>>(
          _onListenChangeProductsIsWishListed,
        ));
  }

  StreamSubscription<List<Product>> _onListenChangeProductsIsWishListed(
    Stream<List<Product>> inputStream,
    bool cancelOnError,
  ) {
    // Create the result controller.
    // Using `sync` is correct here, since only async events are forwarded.
    final controller = StreamController<List<Product>>(sync: true);
    controller.onListen = () {
      final subscription = inputStream.listen((allProducts) {
        final wishlistState = _wishlistBloc.state;
        log("wishlistState wishlistState wishlistState:: before return products $wishlistState");
        final List<Product> updatedList;
        if (wishlistState is! LoadingWishListState) {
          updatedList = allProducts.map((product) {
            if (wishlistState.ids.contains(product.id)) {
              return product.copyWith(isWishListed: true);
            } else {
              return product;
            }
          }).toList();
          controller.add(updatedList);
        } else {}
        //! testing only
        // controller.add(allProducts);
      },
          onError: controller.addError,
          onDone: controller.close,
          cancelOnError: cancelOnError);
      // Controller forwards pause, resume and cancel events.
      controller
        ..onPause = subscription.pause
        ..onResume = subscription.resume
        ..onCancel = subscription.cancel;
    };
    // Return a new [StreamSubscription] by listening to the controller's
    // stream.
    return controller.stream.listen(null);
  }
}
