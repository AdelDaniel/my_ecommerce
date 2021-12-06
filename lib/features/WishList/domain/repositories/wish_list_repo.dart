import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/wish_list_ids.dart';

abstract class WishListRepo {
  const WishListRepo();
  Future<Either<Failure, WishListIds>> getWishListIds();
  Future<Either<Failure, bool>> updateWishListIds({required String id});
}
