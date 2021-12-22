import 'package:flutter_test/flutter_test.dart';
import 'package:my_ecommerce/features/cart/repositories/cart_repository.dart';

import '../../../fixtures/t_cart_item.dart';
import '../../../fixtures/t_product.dart';

void main() {
  late CartRepository cartRepository;

  setUp(() {
    cartRepository = CartRepository();
  });

  test('Should add Item To Cart when call addItemToCart(item)', () async {
    // act
    cartRepository.addItemToCart(tProduct);
    // assertion
    expect(cartRepository.cartItems[0], tCartItem);
  });

  test('Should throw Exception() when call addItemToCart(item)', () async {
    // act
    cartRepository.addItemToCart(tProduct);
    final actualResult = cartRepository.addItemToCart(tProduct);
    // assertion
    expect(() => actualResult,
        equals(Exception(["The Product is already added to the cart!"])));
  });

  // test(
  //     'Should return Left(CacheFailure()) when call getWishListIdsUseCase.call()',
  //     () async {
  //   // arrange
  //   when(mockWishListRepo.getWishListIds())
  //       .thenAnswer((_) async => const Left(CacheFailure()));
  //   // act
  //   final actualResult = await getWishListIdsUseCase();
  //   // assertion
  //   expect(actualResult, const Left(CacheFailure()));
  // });

  // test(
  //     'Should return Right(WishListIds(tIdsList)) when call getWishListIdsUseCase.call()',
  //     () async {
  //   // arrange
  //   when(mockWishListRepo.getWishListIds())
  //       .thenAnswer((_) async => const Right(WishListID(ids: tIdsList)));
  //   // act
  //   final actualResult = await getWishListIdsUseCase();
  //   // assertion
  //   expect(actualResult, const Right(WishListID(ids: tIdsList)));
  // });
}
