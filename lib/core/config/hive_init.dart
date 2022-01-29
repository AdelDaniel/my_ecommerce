import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/wish_list/domain/entities/wish_list_id.dart';
import '../constants/hive_constants.dart';

Future<void> hiveInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WishListIDAdapter());
  await Hive.openBox<WishListID>(idsWishListBoxName);
  await Hive.openBox(productsWishListBoxName);
}
