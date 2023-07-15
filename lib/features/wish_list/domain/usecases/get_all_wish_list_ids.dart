import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/wish_list_id.dart';
import '../repositories/wish_list_repo.dart';

class GetAllWishListIdsUseCase extends UseCase<List<String>, NoParams> {
  final WishListRepo repo;
  const GetAllWishListIdsUseCase(this.repo);
  @override
  Future<Either<Failure, List<String>>> call(
      {NoParams params = const NoParams()}) {
    return repo.getAllWishListIds();
  }
}
