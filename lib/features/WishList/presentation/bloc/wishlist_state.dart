part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class LoadingWishListState extends WishlistState {}

class LoadedWishListState extends WishlistState {}

class AddToWishList extends WishlistState {}

class RemoveFromWishList extends WishlistState {}
