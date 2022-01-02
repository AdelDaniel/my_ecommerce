import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/models/models.dart';

abstract class ProductBaseFirebaseDataSource {
  const ProductBaseFirebaseDataSource();
  Stream<List<Product>> getAllProducts();
  FutureOr<DocumentReference<Map<String, dynamic>>> addProduct(
      {required Product product});
}

class ProductFirebaseDataSource extends ProductBaseFirebaseDataSource {
  static const String _productsCollectionName = "products";
  final FirebaseFirestore _firestore;
  const ProductFirebaseDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Stream<List<Product>> getAllProducts() {
    try {
      return _firestore
          .collection(_productsCollectionName)
          .snapshots()
          .map((snapshot) {
        final returndList = snapshot.docs
            .map((DocumentSnapshot doc) =>
                Product.fromDocumentSnapshot(doc).copyWith(id: doc.id))
            .toList();
        log("products List: $returndList");
        return returndList;
      });
    } catch (e) {
      log('firebase error : $e');
      throw const ServerException();
    }
  }

  @override
  FutureOr<DocumentReference<Map<String, dynamic>>> addProduct(
          {required Product product}) =>
      _firestore.collection(_productsCollectionName).add(product.toMap());
}
