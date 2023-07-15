import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/wish_list/domain/entities/wish_list_id.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/wish_list_id_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/wish_list_repo.dart';

class RemoveFromWishListUseCase extends UseCase<List<String>, WishListParams> {
  final WishListRepo repo;
  const RemoveFromWishListUseCase(this.repo);

  /// the WishListIdParams: WishListIdParams(id:)
  @override
  Future<Either<Failure, List<String>>> call({required WishListParams params}) {
    return repo.removeFromWishList(product: params.product);
  }
}
