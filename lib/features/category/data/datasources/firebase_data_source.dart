import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/models/models.dart';

abstract class BaseFirebaseDataSource {
  const BaseFirebaseDataSource();
  Stream<List<Category>> getAllCategories();
}

class FirebaseDataSource extends BaseFirebaseDataSource {
  static const String _categoriesCollectionName = "categories";
  final FirebaseFirestore _firestore;
  const FirebaseDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Stream<List<Category>> getAllCategories() {
    // final snapshot =
    //     _firestore.collection(_categoriesCollectionName).snapshots();
    // final categoriesList =
    //     snapshot.map((QuerySnapshot<Map<String, dynamic>> snapshot) {
    //   return snapshot.docs.map((DocumentSnapshot document) {
    //     final Map<String, dynamic> data =
    //         document.data()! as Map<String, dynamic>;
    //     return Category.fromMap(data).copyWith(id: document.id);
    //   }).toList();
    // });
    // log("categories List: $categoriesList");
    // return categoriesList;
    try {
      return _firestore
          .collection(_categoriesCollectionName)
          .snapshots()
          .map((snapshot) {
        final returndList = snapshot.docs
            .map(
              (DocumentSnapshot doc) =>
                  Category.fromDocumentSnapshot(doc).copyWith(id: doc.id),
            )
            .toList();
        log("categories List: $returndList");
        return returndList;
      });
    } catch (e) {
      log('firebase error : $e');
      throw const ServerException();
    }
  }
}
