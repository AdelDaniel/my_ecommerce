import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/models/models.dart';

// const _delay = Duration(milliseconds: 800);

class CartRepository {
  final List<CartItem> _items = <CartItem>[];

  List<CartItem> get cartItems => _items;

  void addItemToCart(Product product) {
    try {
      final isProductExistInCart =
          _items.any((cartItem) => cartItem.product == product);

      if (!isProductExistInCart) {
        return _items.add(CartItem(product: product));
      }
      // TODO :: check on it at bloc file
      throw const CacheException(
          detailedMsg: "This Product is already added to the cart!");
    } catch (e) {
      throw const CacheException(
          detailedMsg:
              "Something went wrong while adding the product to the cart!");
    }
  }

  void removeItemFromCart(CartItem item) {
    try {
      final isTheCartItemExistInCart =
          _items.any((cartItem) => cartItem == item);

      if (isTheCartItemExistInCart) {
        _items.remove(item);
      } else {
        throw const CacheException(
            detailedMsg: "This Product Doesn't Exist at the cart!");
      }
    } catch (e) {
      throw const CacheException(
          detailedMsg:
              "Something went wrong while deleting the product from the cart!");
    }
  }

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
