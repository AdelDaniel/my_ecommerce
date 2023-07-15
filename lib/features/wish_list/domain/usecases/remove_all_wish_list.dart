import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/params/no_params.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/wish_list_repo.dart';

class RemoveAllUseCase extends UseCase<void, NoParams> {
  final WishListRepo repo;
  const RemoveAllUseCase(this.repo);

  /// the WishListIdParams: WishListIdParams(id:)
  @override
  Future<Either<Failure, void>> call({NoParams params = const NoParams()}) {
    return repo.removeAllWishList();
  }
}
