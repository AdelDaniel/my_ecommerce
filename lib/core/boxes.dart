import 'package:hive/hive.dart';
import '../features/wish_list/domain/entities/wish_list_id.dart';

import 'constants/hive_constants.dart';

// class Boxes {
// static  Box<WishListID> geWishListIDBox   =>  Hive.box<WishListID>(wishListboxName);
// }

Box<WishListID> getWishListIDBox() => Hive.box<WishListID>(idsWishListBoxName);
Box getProductOfWishListBox() => Hive.box(productsWishListBoxName);
