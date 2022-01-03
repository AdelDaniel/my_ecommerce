import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/features/checkout/models/checkout_model.dart';

abstract class CheckoutBaseFirebaseDataSource {
  const CheckoutBaseFirebaseDataSource();
  Future<void> saveCheckoutAtFireStore(Checkout checkout);
}

class CheckoutFirebaseDataSource extends CheckoutBaseFirebaseDataSource {
  static const String _checkoutCollectionName = "checkout";
  final FirebaseFirestore _firestore;
  const CheckoutFirebaseDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> saveCheckoutAtFireStore(Checkout checkout) async {
    try {
      final checkoutFireStore = _firestore.collection(_checkoutCollectionName);
      await checkoutFireStore.add(checkout.toMap());
    } catch (e) {
      log('firebase error : $e');
      throw const ServerException();
    }
  }
}
