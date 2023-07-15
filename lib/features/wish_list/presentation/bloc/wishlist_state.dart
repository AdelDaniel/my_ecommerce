part of 'wishlist_bloc.dart';

// @freezed
// class WishlistState with _$WishlistState{
//    const factory WishlistState({
//     required bool isAuthenticated,
//     required bool isFirstTimeOpenTheApp,
//   }) = _WishlistState;

//   // the initial state with its data
//   factory WishlistState.initial() => const WishlistState(
//         isFirstTimeOpenTheApp: true,
//         isAuthenticated: false,
//       );
// }

abstract class WishlistState extends Equatable {
  List<String> get ids;
  const WishlistState();
}

class LoadingWishListState extends WishlistState {
  const LoadingWishListState({required this.ids});
  @override
  final List<String> ids;
  @override
  List<Object> get props => [];
}

class EmptyWishListState extends WishlistState {
  const EmptyWishListState([this.ids = const []]);
  @override
  final List<String> ids;
  @override
  List<Object> get props => [];
}

class ErrorWishListState extends WishlistState {
  const ErrorWishListState({
    required this.failure,
    this.product,
    required this.ids,
  });
  final Failure failure;
  final Product? product;
  @override
  final List<String> ids;

  @override
  List<Object?> get props => [failure, product];
}

class LoadedWishListIdsState extends WishlistState {
  const LoadedWishListIdsState(this.ids);
  @override
  final List<String> ids;

  @override
  List<Object> get props => [ids, ids.length];
}

// class LoadedWishListProductsState extends WishlistState {
//   const LoadedWishListProductsState(this.wishListProducts);
//   final WishListProducts wishListProducts;

//   @override
//   List<Object> get props =>
//       [wishListProducts.products, wishListProducts.products.length];
// }
