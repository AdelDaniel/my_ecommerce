part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutLoadingState extends CheckoutState {
  const CheckoutLoadingState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoadedState extends CheckoutState {
  final Checkout checkout;

  const CheckoutLoadedState({required this.checkout});

  @override
  List<Object> get props => [checkout];
}
// class CheckoutLoadedState extends CheckoutState {
//   final String? fullName;
//   final String? email;
//   final String? address;
//   final String? city;
//   final String? country;
//   final String? zipCode;
//   final String? phoneNumber;
//   final List<CartItem>? cartItems;
//   final String? subtotal;
//   final String? deliveryFee;
//   final String? total;
//   final Checkout checkout;

//   CheckoutLoaded({
//     this.fullName,
//     this.email,
//     this.phoneNumber,
//     this.address,
//     this.city,
//     this.country,
//     this.zipCode,
//     this.cartItems,
//     this.subtotal,
//     this.deliveryFee,
//     this.total,
//   }) : checkout = checkout.copyWith(
//           fullName: fullName,
//           email: email,
//           address: address,
//           city: city,
//           country: country,
//           zipCode: zipCode,
//           products: products,
//           subtotal: subtotal,
//           deliveryFee: deliveryFee,
//           total: total,
//         );

//   @override
//   List<Object?> get props => [
//         fullName,
//         email,
//         address,
//         city,
//         country,
//         zipCode,
//         cartItems,
//         subtotal,
//         deliveryFee,
//         total,
//       ];
// }
