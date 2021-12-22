// import 'dart:async';

import 'package:my_ecommerce/models/cart_model.dart';
import 'package:my_ecommerce/models/models.dart';

// const _delay = Duration(milliseconds: 800);

class CartRepository {
  CartRepository() : _items = <CartItem>[];
  final List<CartItem> _items;

  // Future<List<CartItem>> loadCartItems() =>
  //     Future.delayed(_delay, () => _items);

  List<CartItem> get cartItems => _items;
  void addItemToCart(Product product) {
    final isProductExistInCart =
        _items.any((cartItem) => cartItem.product == product);

    if (!isProductExistInCart) {
      return _items.add(CartItem(product: product));
    }
    // TODO :: move this exception to the error folder and check on it at bloc file
    // throw Exception(["The Product is already added to the cart!"]);
  }

  void removeItemFromCart(CartItem item) => _items.remove(item);

  void incerementCartItem(CartItem item) {
    if (item.product.allQuentity > item.quantity) {
      ++item.quantity;
    }
  }

  void decerementCartItem(CartItem item) {
    if (item.quantity > 1) {
      --item.quantity;
    }
  }
}
