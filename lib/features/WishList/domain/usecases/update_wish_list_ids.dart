import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/core/usecase/usecase.dart';
import 'package:my_ecommerce/features/WishList/domain/repositories/wish_list_repo.dart';

class UpdateWishListIdsUseCase extends UseCase<bool, WishListIdParams> {
  final WishListRepo repo;
  const UpdateWishListIdsUseCase(this.repo);

  /// the WishListIdParams: WishListIdParams(id:)
  @override
  Future<Either<Failure, bool>> call({required WishListIdParams params}) {
    return repo.updateWishListIds(id: params.id);
  }
}

class WishListIdParams extends Equatable {
  final String id;
  const WishListIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
