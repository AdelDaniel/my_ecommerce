import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/features/product/data/datasources/product_firebase_data_source.dart';
import 'package:my_ecommerce/features/product/data/repositories/product_repository_impl.dart';

Future<void> productInjectionContainersetup(GetIt sl) async {
//! Feature - Proudcts
// Bloc

// Repository
  sl.registerLazySingleton(() => ProductRepository(
      productFirebaseDataSource: sl<ProductFirebaseDataSource>()));

// Data sources
// Firebase
  sl.registerLazySingleton(
      () => ProductFirebaseDataSource(firestore: FirebaseFirestore.instance));
}
