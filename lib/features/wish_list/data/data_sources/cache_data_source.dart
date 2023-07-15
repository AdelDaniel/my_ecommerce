import 'dart:async';
import 'dart:developer';

import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:my_ecommerce/features/wish_list/domain/entities/wish_list_id.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../models/models.dart';
import '../../domain/entities/wish_list_products.dart';

class ProductCachedData {
  final ProductBloc _productBloc;
  const ProductCachedData({required ProductBloc productBloc})
      : _productBloc = productBloc;

  void addToWishList({required Product value}) {
    try {
      final ProductState state = _productBloc.state;
      final String productId = value.id;
      if (state is LoadedProductState) {
        final List<Product> updateProductsProgress = List.of(state.products)
          ..firstWhere((product) => product.id == productId)
              .copyWith(isWishListed: true);

        // final List<Product> updateProductsProgress =
        //     state.products.map((product) {
        //   return product.id == productId
        //       ? product.copyWith(isWishListed: true)
        //       : product;
        // }).toList();

        _productBloc.add(UpdateProductsEvent(products: updateProductsProgress));

        // unawaited(repository.deleteItem(id).then((_) {
        //   final deleteSuccess = List.of(state.items)
        //     ..removeWhere((element) => element.id == id);
        //   emit(ComplexListState.success(deleteSuccess));
        // }));
      }
      // final bool isProductExistInWishList =
      //     _wishListProducts.products.any((item) => item.id == value.id);
      // if (!isProductExistInWishList) {
      //   _wishListProducts.addProductToWishList(value);
      // } else {
      //   throw const CacheException(
      //       detailedMsg: "The Product is already added to the wish list");
      // }
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }

  void removeFromWishList({required Product value}) {
    try {
      final ProductState state = _productBloc.state;
      final String productId = value.id;
      if (state is LoadedProductState) {
        final List<Product> updateProductsProgress = List.of(state.products)
          ..firstWhere((product) => product.id == productId)
              .copyWith(isWishListed: false);

        // final List<Product> updateProductsProgress =
        //     state.products.map((product) {
        //   return product.id == productId
        //       ? product.copyWith(isWishListed: true)
        //       : product;
        // }).toList();

        _productBloc.add(UpdateProductsEvent(products: updateProductsProgress));

        // unawaited(repository.deleteItem(id).then((_) {
        //   final deleteSuccess = List.of(state.items)
        //     ..removeWhere((element) => element.id == id);
        //   emit(ComplexListState.success(deleteSuccess));
        // }));
      }
      // final bool isProductExistInWishList =
      //     _wishListProducts.products.any((item) => item.id == value.id);
      // if (!isProductExistInWishList) {
      //   _wishListProducts.addProductToWishList(value);
      // } else {
      //   throw const CacheException(
      //       detailedMsg: "The Product is already added to the wish list");
      // }
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }

  void removeAllWishList() {
    try {
      final ProductState state = _productBloc.state;
      if (state is LoadedProductState) {
        final List<Product> updateProductsProgress =
            state.products.map((product) {
          return product.isWishListed == true
              ? product.copyWith(isWishListed: false)
              : product;
        }).toList();

        _productBloc.add(UpdateProductsEvent(products: updateProductsProgress));
      }
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }
}

// class ProductCachedData {
//   final WishListProducts _wishListProducts;
//   const ProductCachedData({required WishListProducts wishListProducts})
//       : _wishListProducts = wishListProducts;

//   WishListProducts get wishListProducts => _wishListProducts;

//   void addToWishList({required Product value}) {
//     try {
//       final bool isProductExistInWishList =
//           _wishListProducts.products.any((item) => item.id == value.id);
//       if (!isProductExistInWishList) {
//         _wishListProducts.addProductToWishList(value);
//       } else {
//         throw const CacheException(
//             detailedMsg: "The Product is already added to the wish list");
//       }
//     } catch (e) {
//       log('the Failure in cache is: $e');
//       throw const CacheException();
//     }
//   }

//   void removeFromWishList({required Product value}) {
//     try {
//       _wishListProducts.removeProductFromWishList(value);
//     } catch (e) {
//       log('the Failure in cache is: $e');
//       throw const CacheException();
//     }
//   }

//   void removeAllWishList() {
//     try {
//       _wishListProducts.products.clear();
//     } catch (e) {
//       log('the Failure in cache is: $e');
//       throw const CacheException();
//     }
//   }
// }

class WishListIdsCachedData {
  const WishListIdsCachedData();
  static List<String> _allWishListIDs = <String>[];
  void updateWishListIDs(List<String> list) {
    for (final element in list) {
      _allWishListIDs.add(element);
    }
  }

  void updateWishListIDsFromString(List<String> list) {
    _allWishListIDs = list;
    // for (final id in list) {
    //   _allWishListIDs.add(WishListID(id: id));
    // }
  }

  bool get isEmpty => _allWishListIDs.isEmpty;
  List<String> get allWishListIDs => _allWishListIDs;

  List<String> addToWishList({required Product value}) {
    try {
      final bool isProductExistInWishList = _allWishListIDs.contains(value.id);
      if (!isProductExistInWishList) {
        _allWishListIDs.add(value.id);
      } else {
        throw const CacheException(
            detailedMsg: "The Product is already added to the wish list");
      }
      // final bool isProductExistInWishList =
      //     _allWishListIDs.any((item) => item.id == value.id);
      // if (!isProductExistInWishList) {
      //   _allWishListIDs.add(WishListID(id: value.id));
      // } else {
      //   throw const CacheException(
      //       detailedMsg: "The Product is already added to the wish list");
      // }
      return _allWishListIDs;
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }

  List<String> removeFromWishList({required Product value}) {
    try {
      _allWishListIDs.remove(value.id);
      // _allWishListIDs.removeWhere((wishListID) => wishListID.id == value.id);
      log('removed');
      return _allWishListIDs;
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }

  void removeAllWishList() {
    try {
      _allWishListIDs.clear();
    } catch (e) {
      log('the Failure in cache is: $e');
      throw const CacheException();
    }
  }
}
