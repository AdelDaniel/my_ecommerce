import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../../models/product_model.dart';

class WishListProducts extends Equatable {
  final List<Product> _products = <Product>[];
  List<Product> get products => _products;

  void addProductToWishList(Product product) => _products.insert(0, product);
  void removeProductFromWishList(Product product) => _products.remove(product);

  List<Product> updateList(List<Product> _newProductsList) {
    _products.clear();
    for (final product in _newProductsList) {
      _products.add(product);
    }
    return _products;
  }

  // factory WishListProducts.fromJson(String str) =>
  //     WishListProducts.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  // factory WishListProducts.fromMap(Map<String, dynamic> json) => WishListProducts(
  //       _products: List<Product>.from((json["_products"] as List<String>)
  //           .map((String p) => Product.fromJson(p))),
  //     );

  Map<String, dynamic> toMap() => {
        "_products":
            List<dynamic>.from(_products.map((Product p) => p.toJson())),
      };

  @override
  List<Object?> get props => [_products];
}
