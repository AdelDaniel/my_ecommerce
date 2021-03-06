import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class CartItem {
  static const String _quantityColumn = "quantity";
  static const String _productColumn = "product";
  CartItem({this.quantity = 1, required this.product});
  int quantity;
  final Product product;

  factory CartItem.fromJson(String str) =>
      CartItem.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        quantity: (json[_quantityColumn] ?? 0) as int,
        product: (json[_productColumn] ?? " ") as Product,
      );

  factory CartItem.fromDocumentSnapshot(DocumentSnapshot doc) {
    final Map<String, dynamic> data;
    if (doc.data() != null) {
      data = doc.data()! as Map<String, dynamic>;
    } else {
      data = <String, dynamic>{};
    }
    return CartItem.fromMap(data);
  }

  Map<String, dynamic> toMap() =>
      {_quantityColumn: quantity, _productColumn: product.toMap()};

  CartItem copyWith({
    int? quantity,
    Product? product,
  }) =>
      CartItem(
        quantity: quantity ?? this.quantity,
        product: product ?? this.product,
      );
}

class Cart extends Equatable {
  final List<CartItem> cartItems;
  const Cart({this.cartItems = const <CartItem>[]});

  @override
  List<Object?> get props => cartItems;

/* ! the comming code Error :::  Cannot add to an unmodifiable list
  void addItemToCart(CartItem cartItem) => cartItems.add(cartItem);
  void removeItemFromCart(CartItem cartItem) => cartItems.remove(cartItem);
*/
  // Map productQuantity(Product products) {
  //   var quantity = Map();

  //   products.forEach((product) {
  //     if (!quantity.containsKey(product)) {
  //       quantity[product] = 1;
  //     } else {
  //       quantity[product] += 1;
  //     }
  //   });

  //   return quantity;
  // }

  //? The Total of the Products
  int get productsNumberInCart =>
      cartItems.fold<int>(0, (total, cartItem) => total + cartItem.quantity);

  //? The Total of the price of Products only
  double get subTotal => cartItems.fold<double>(
      0,
      (total, cartItem) =>
          total + (cartItem.product.price) * cartItem.quantity);

  //? the price of deleviry
  double _calculateDeliveryFee(double subTotal) {
    if (subTotal < 30.0) {
      return 0.0;
    } else if (subTotal < 80.0) {
      return 15.0;
    } else if (subTotal < 200.0) {
      return 20.0;
    } else if (subTotal < 500.0) {
      return 35.0;
    } else if (subTotal < 1000.0) {
      return 50.0;
    } else {
      return 90.0;
    }
  }

  //? the total price = product + deleviry
  double _calculateTotal(double subTotal, double deliveryFee) =>
      subTotal + _calculateDeliveryFee(subTotal);

  double get deliveryFee => _calculateDeliveryFee(subTotal);
  double get total =>
      _calculateTotal(subTotal, _calculateDeliveryFee(subTotal));

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);

  String get totalString => total.toStringAsFixed(2);

//? fee for delivery
  // String freeDelivery(double subTotal) {
  //   if (subTotal >= 30.0) {
  //     return 'You have Free Delivery';
  //   } else {
  //     double missing = 30.0 - subTotal;
  //     return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
  //   }
  // }
  String get freeDeliveryString => "Free Delivery!"; // freeDelivery(subTotal);

}
