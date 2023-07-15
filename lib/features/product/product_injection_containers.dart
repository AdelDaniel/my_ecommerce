import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/features/product/data/datasources/product_firebase_data_source.dart';
import 'package:my_ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:my_ecommerce/features/wish_list/presentation/bloc/wishlist_bloc.dart';

Future<void> productInjectionContainersetup(GetIt sl) async {
//! Feature - Products
// Bloc
  sl.registerLazySingleton(() => ProductBloc(
        productRepository: sl<ProductRepository>(),
        wishlistBloc: sl<WishlistBloc>(),
      )..add(const LoadProductEvent()));
// Repository
  sl.registerLazySingleton(() => ProductRepository(
        wishlistBloc: sl<WishlistBloc>(),
        productFirebaseDataSource: sl<ProductFirebaseDataSource>(),
      ));

// Data sources
// Firebase
  sl.registerLazySingleton(
      () => ProductFirebaseDataSource(firestore: FirebaseFirestore.instance));
}
