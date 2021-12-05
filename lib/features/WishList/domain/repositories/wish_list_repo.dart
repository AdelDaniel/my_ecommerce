import 'package:dartz/dartz.dart';

import 'package:my_ecommerce/core/error/failure.dart';

abstract class WishListRepo {
  Future<Either<Failure, List<String>>> getWishListIds();
  Future<Either<Failure, bool>> updateWishListIds({required String id});
}
