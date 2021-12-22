part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CreateCartEvent extends CartEvent {
  const CreateCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCartEvent extends CartEvent {
  const AddProductToCartEvent({required this.product});
  final Product product;

  @override
  List<Product> get props => [product];
}

class RemoveProductFromCartEvent extends CartEvent {
  const RemoveProductFromCartEvent({required this.cartItem});
  final CartItem cartItem;

  @override
  List<CartItem> get props => [cartItem];
}

class IncreaseProductQuantityEvent extends CartEvent {
  const IncreaseProductQuantityEvent({required this.cartItem});
  final CartItem cartItem;

  @override
  List<Object> get props => [cartItem.quantity];
}

class DecreaseProductQuantityEvent extends CartEvent {
  const DecreaseProductQuantityEvent({required this.cartItem});
  final CartItem cartItem;

  @override
  List<Object> get props => [cartItem.quantity];
}
