import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/wish_list_products.dart';
import '../repositories/wish_list_repo.dart';

class GetAllWishListProductsUseCase
    extends UseCase<WishListProducts, NoParams> {
  final WishListRepo repo;
  const GetAllWishListProductsUseCase(this.repo);
  @override
  Future<Either<Failure, WishListProducts>> call(
      {NoParams params = const NoParams()}) {
    return repo.getAllWishListProducts();
  }
}
