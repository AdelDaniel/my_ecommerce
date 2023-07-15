import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/error/failure.dart';

abstract class IUpdateUserFirestoreData {
  static Option<String> userId = const None();
  const IUpdateUserFirestoreData();
  Future<Either<Failure, Unit>> addWishListId({
    required String productId,
  });
  Future<Either<Failure, Unit>> removeWishListId({
    required String productId,
  });
}
