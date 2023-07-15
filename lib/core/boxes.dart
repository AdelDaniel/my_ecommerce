import 'package:hive/hive.dart';
import '../features/wish_list/domain/entities/wish_list_id.dart';

import 'constants/hive_constants.dart';

// class Boxes {
// static  Box<String> geWishListIDBox   =>  Hive.box<String>(wishListboxName);
// }

// TODO may be you will remove hive not necessary
// Box<String> getWishListIDBox() => Hive.box<String>(idsWishListBoxName);
Box getProductOfWishListBox() => Hive.box(productsWishListBoxName);
