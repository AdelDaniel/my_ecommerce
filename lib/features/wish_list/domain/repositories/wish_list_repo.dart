import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../models/product_model.dart';
import '../entities/wish_list_id.dart';
import '../entities/wish_list_products.dart';

abstract class WishListRepo {
  const WishListRepo();
  Future<Either<Failure, List<String>>> getAllWishListIds();
  Future<Either<Failure, WishListProducts>> getAllWishListProducts();
  Future<Either<Failure, void>> removeAllWishList();
  Future<Either<Failure, List<String>>> addToWishList(
      {required Product product});
  Future<Either<Failure, List<String>>> removeFromWishList(
      {required Product product});
}
