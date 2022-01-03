import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/features/checkout/datasources/checkout_firebase_data_source.dart';
import 'package:my_ecommerce/features/checkout/repositories/base_checkout_repository.dart';

Future<void> checkoutInjectionContainersetup(GetIt sl) async {
//! Feature - checkout
// Bloc
  // sl.registerLazySingleton(() => CheckoutBloc(
  //     cartBloc: sl<CartBloc>(), repository: sl<CheckoutRepository>()));

// Repository
  sl.registerLazySingleton(() =>
      CheckoutRepository(checkoutFirebase: sl<CheckoutFirebaseDataSource>()));

// Data sources
// Firebase
  sl.registerLazySingleton(
      () => CheckoutFirebaseDataSource(firestore: FirebaseFirestore.instance));

//local
  // sl.registerLazySingleton(() => IdsLocalDataSourceHive(getWishListIDBox()));
}
