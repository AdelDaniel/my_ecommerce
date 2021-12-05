import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/core/usecase/usecase.dart';
import 'package:my_ecommerce/features/WishList/domain/repositories/wish_list_repo.dart';

class GetWishListIdsUseCase extends UseCase<List<String>, NoParams> {
  final WishListRepo repo;
  const GetWishListIdsUseCase(this.repo);
  @override
  Future<Either<Failure, List<String>>> call(
      {NoParams params = const NoParams()}) {
    return repo.getWishListIds();
  }
}
