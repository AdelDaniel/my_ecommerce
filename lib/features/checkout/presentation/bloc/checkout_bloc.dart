import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:my_ecommerce/features/checkout/models/checkout_model.dart';
import 'package:my_ecommerce/features/checkout/repositories/base_checkout_repository.dart';
import 'package:my_ecommerce/models/cart_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

/// States :: CheckoutLoadingState & CheckoutLoadedState
/// Events ::  UpdateCheckoutEvent & ConfirmCheckoutEvent
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _repository;
  StreamSubscription? _cartBlocSubscription;
  StreamSubscription? _checkoutBlocSubscription;
  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository repository,
  })  : _cartBloc = cartBloc,
        _repository = repository,
        super(cartBloc.state is CartLoadedState
            ? CheckoutLoadedState(
                checkout: Checkout(
                fullName: " ",
                email: " ",
                addressDetails: const AddressDetails(
                    phoneNumber: " ",
                    address: " ",
                    city: " ",
                    country: " ",
                    zipCode: " "),
                cartItems: (cartBloc.state as CartLoadedState).cart.cartItems,
                subtotal:
                    (cartBloc.state as CartLoadedState).cart.subTotalString,
                deliveryFee:
                    (cartBloc.state as CartLoadedState).cart.deliveryFeeString,
                total:
                    (cartBloc.state as CartLoadedState).cart.deliveryFeeString,
              ))
            : const CheckoutLoadingState()) {
    _cartBlocSubscription?.cancel();
    _cartBlocSubscription = _cartBloc.stream.listen((CartState cartstate) {
      if (cartstate is CartLoadedState) {
        add(UpdateCheckoutEvent(cart: cartstate.cart));
      }
    });
    on<UpdateCheckoutEvent>(_onUpdateCheckoutEvent);
    on<ConfirmCheckoutEvent>(_onConfirmCheckoutEvent);
  }

  FutureOr<void> _onUpdateCheckoutEvent(
      UpdateCheckoutEvent event, Emitter emit) {
    if (state is CheckoutLoadedState) {
      final CheckoutLoadedState currentState = state as CheckoutLoadedState;
      final Checkout oldCheckout = currentState.checkout;
      emit(
        CheckoutLoadedState(
          checkout: oldCheckout.copyWith(
            address: event.address,
            city: event.city,
            country: event.country,
            email: event.email,
            fullName: event.fullName,
            phoneNumber: event.phoneNumber,
            deliveryFee: event.cart == null
                ? oldCheckout.deliveryFee
                : event.cart!.deliveryFeeString,
            cartItems: event.cart == null
                ? oldCheckout.cartItems
                : event.cart!.cartItems,
            subtotal: event.cart == null
                ? oldCheckout.subtotal
                : event.cart!.subTotalString,
            total: event.cart == null
                ? oldCheckout.total
                : event.cart!.totalString,
            zipCode: event.zipCode ?? oldCheckout.addressDetails.zipCode,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onConfirmCheckoutEvent(
      ConfirmCheckoutEvent event, emit) async {
    try {
      _checkoutBlocSubscription?.cancel();
      if (state is CheckoutLoadedState) {
        await _repository.addCheckout(event.checkout);
      }
    } catch (e) {
      log('Error $e');
    }
  }
}
