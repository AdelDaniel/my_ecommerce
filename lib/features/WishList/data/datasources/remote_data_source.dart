import '../../domain/entities/wish_list_ids.dart';

abstract class AbstractRemoteDataSource {
  Future<WishListIds> getWishListIds();
  Future<bool> updateWishListIds({String id});
}
