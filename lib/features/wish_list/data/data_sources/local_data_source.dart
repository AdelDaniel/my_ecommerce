import 'dart:async';
import 'dart:developer';

import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../models/models.dart';

import '../../domain/entities/wish_list_id.dart';

abstract class AbstractLocalDataSource<T> {
  FutureOr<List<T>> getAllWishList();
  FutureOr<void> addToWishList({required T value});
  FutureOr<void> removeFromWishList({required T value});
  FutureOr<void> removeAll();
}

// class IdsLocalDataSourceHive implements AbstractLocalDataSource<WishListID> {
//   final Box<WishListID> _box;
//   const IdsLocalDataSourceHive(Box<WishListID> box) : _box = box;

//   @override
//   FutureOr<List<WishListID>> getAllWishList() {
//     try {
//       return _box.values.toList().cast<WishListID>();
//     } catch (e) {
//       throw const LocalException();
//     }
//   }

//   @override
//   FutureOr<void> addToWishList({required WishListID value}) async {
//     try {
//       _box.put(value.id, value);
//     } catch (e) {
//       log('the Failure is: $e');
//       throw const LocalException();
//     } finally {
//       log(_box.values.toList().toString());
//     }
//   }

//   @override
//   FutureOr<void> removeFromWishList({required WishListID value}) async {
//     try {
//       _box.delete(value.id);
//     } catch (e) {
//       throw const LocalException();
//     }
//   }

//   @override
//   FutureOr<void> removeAll() async {
//     await _box.clear();
//   }
// }

class ProductsLocalDataSourceHive implements AbstractLocalDataSource<Product> {
  final Box _box;
  const ProductsLocalDataSourceHive(Box box) : _box = box;

  @override
  FutureOr<List<Product>> getAllWishList() async {
    try {
      //! get using an id >>  return [Product.fromJson(await _box.get("1") as String)];
      final productsStringList = _box.values.toList();
      return productsStringList
          .map((stringProduct) => Product.fromJson(stringProduct as String))
          .toList();
    } catch (e) {
      throw const LocalException();
    }
  }

  @override
  FutureOr<void> addToWishList({required Product value}) async {
    try {
      _box.put(value.id, value.toJson());
    } catch (e) {
      log('the Failure is: $e');
      throw const LocalException();
    }
  }

  @override
  FutureOr<void> removeFromWishList({required Product value}) async {
    try {
      _box.delete(value.id);
    } catch (e) {
      throw const LocalException();
    }
  }

  @override
  FutureOr<void> removeAll() async {
    await _box.clear();
  }
}
