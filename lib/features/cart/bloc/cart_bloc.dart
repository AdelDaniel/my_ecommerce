import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/cart_model.dart';
import '../../../models/models.dart';
import '../repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

/// States: CartLoadingState & CartLoadedState & CartErrorState
/// Events: CreateCartEvent & AddProductToCartEvent & RemoveProductFromCartEvent
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(const CartLoadingState()) {
    on<CreateCartEvent>(_onCreateCartEvent);
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCartEvent);
    on<IncreaseProductQuantityEvent>(_onIncreaseProductQuantityEvent);
    on<DecreaseProductQuantityEvent>(_onDecreaseProductQuantityEvent);
  }

  Future<void> _onCreateCartEvent(event, emit) async {
    emit(const CartLoadingState());
    try {
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(const CartLoadedState());
    } catch (_) {
      emit(const CartErrorState());
    }
  }

  void _onAddProductToCartEvent(AddProductToCartEvent event, emit) {
    if (state is CartLoadedState) {
      try {
        cartRepository.addItemToCart(event.product);
        emit(CartLoadedState(
          cart: Cart(cartItems: List.from(cartRepository.cartItems)),
        ));
      } on Exception {
        emit(const CartErrorState());
      }
    }
  }

  void _onRemoveProductFromCartEvent(RemoveProductFromCartEvent event, emit) {
    if (state is CartLoadedState) {
      try {
        cartRepository.removeItemFromCart(event.cartItem);
        emit(CartLoadedState(
          cart: Cart(cartItems: List.from(cartRepository.cartItems)),
        ));
      } on Exception {
        emit(const CartErrorState());
      }
    }
  }

  void _onIncreaseProductQuantityEvent(
      IncreaseProductQuantityEvent event, emit) {
    if (state is CartLoadedState) {
      try {
        emit(const CartLoadingState());
        cartRepository.incerementCartItem(event.cartItem);
        emit(CartLoadedState(
          cart: Cart(cartItems: List.from(cartRepository.cartItems)),
        ));
      } on Exception {
        emit(const CartErrorState());
      }
    }
  }

  void _onDecreaseProductQuantityEvent(
      DecreaseProductQuantityEvent event, emit) {
    if (state is CartLoadedState) {
      try {
        emit(const CartLoadingState());
        cartRepository.decerementCartItem(event.cartItem);
        emit(CartLoadedState(
          cart: Cart(cartItems: List.from(cartRepository.cartItems)),
        ));
      } on Exception {
        emit(const CartErrorState());
      }
    }
  }
}
