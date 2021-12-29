import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/features/category/data/datasources/firebase_data_source.dart';
import 'package:my_ecommerce/features/category/data/repositories/category_repository_impl.dart';
import 'package:my_ecommerce/features/category/presentation/bloc/category_bloc.dart';

Future<void> categoryInjectionContainersetup(GetIt sl) async {
//! Feature - Categories
// Bloc
  sl.registerFactory(() =>
      CategoryBloc(categoryRepository: sl<CategoryRepositoryImpl>())
        ..add(const LoadCategoryEvent()));

// Repository
  sl.registerLazySingleton(() =>
      CategoryRepositoryImpl(firebaseDataSource: sl<FirebaseDataSource>()));

// Data sources
// Firebase
  sl.registerLazySingleton(
      () => FirebaseDataSource(firestore: FirebaseFirestore.instance));

//local
  // sl.registerLazySingleton(() => IdsLocalDataSourceHive(getWishListIDBox()));
}
