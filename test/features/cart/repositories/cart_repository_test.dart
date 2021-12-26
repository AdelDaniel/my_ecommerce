import 'package:flutter_test/flutter_test.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/features/cart/repositories/cart_repository.dart';
import 'package:my_ecommerce/models/cart_model.dart';

import '../../../fixtures/t_cart_item.dart';
import '../../../fixtures/t_product.dart';

void main() {
  late CartRepository cartRepository;

  setUp(() {
    cartRepository = CartRepository();
  });

  group('G: addItemToCart..', () {
    test('Should add Item To Cart when call addItemToCart(item)', () {
      // act
      cartRepository.addItemToCart(tProduct);
      // assertion
      expect(cartRepository.cartItems[0], isA<CartItem>());
    });

    test(
        'Should throw Exception() when call addItemToCart(item) because deplicated product',
        () async {
      //arrange
      cartRepository.addItemToCart(tProduct);
      // act
      final actualResult = cartRepository.addItemToCart;
      // assertion
      expect(() => actualResult(tProduct),
          throwsA(const TypeMatcher<CacheException>()));
      expect(cartRepository.cartItems.length, 1);
    });
  });

  group('G: removeItemFromCart..', () {
    test('Should remove Item form Cart when call removeItemFromCart(item)', () {
      // arrange
      cartRepository.addItemToCart(tProduct);
      // act
      cartRepository.removeItemFromCart(cartRepository.cartItems[0]);
      // assertion
      expect(cartRepository.cartItems.length, 0);
    });

    test(
        'Should throw Exception() when call removeItemFromCart(item) because no product exist',
        () async {
      // act
      final actualResult = cartRepository.removeItemFromCart;
      // assert
      expect(() => actualResult(tCartItem),
          throwsA(const TypeMatcher<CacheException>()));
      expect(cartRepository.cartItems.length, 0);
    });
  });
}
