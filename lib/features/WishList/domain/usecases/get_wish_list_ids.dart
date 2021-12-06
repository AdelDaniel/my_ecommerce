import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/wish_list_ids.dart';
import '../repositories/wish_list_repo.dart';

class GetWishListIdsUseCase extends UseCase<WishListIds, NoParams> {
  final WishListRepo repo;
  const GetWishListIdsUseCase(this.repo);
  @override
  Future<Either<Failure, WishListIds>> call(
      {NoParams params = const NoParams()}) {
    return repo.getWishListIds();
  }
}
