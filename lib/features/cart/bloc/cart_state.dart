part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

// class CartInitial extends CartState {
//   const CartInitial();

//   @override
//   List<Object?> get props => [];
// }

class CartLoadingState extends CartState {
  const CartLoadingState();

  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  const CartLoadedState({this.cart = const Cart()});
  final Cart cart;

  @override
  List<Object> get props => [cart.productsNumberInCart];
}

class CartErrorState extends CartState {
  const CartErrorState();

  @override
  List<Object?> get props => [];
}
