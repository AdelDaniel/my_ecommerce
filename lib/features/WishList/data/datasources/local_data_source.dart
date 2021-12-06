import '../../domain/entities/wish_list_ids.dart';

abstract class AbstractLocalDataSource {
  Future<WishListIds> getWishListIds();
  Future<bool> updateWishListIds({String id});
}
