part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class GetAllWishListIdsEvent extends WishlistEvent {
  const GetAllWishListIdsEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddProductToWishListEvent extends WishlistEvent {
  const AddProductToWishListEvent(this.product);
  final Product product;

  @override
  List<Product> get props => [product];
}

class RemoveProductFromWishListEvent extends WishlistEvent {
  const RemoveProductFromWishListEvent(this.product);
  final Product product;

  @override
  List<Product> get props => [product];
}

class RemoveAllWishList extends WishlistEvent {
  const RemoveAllWishList();

  @override
  List<Object?> get props => [];
}
