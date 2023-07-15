// getIt
// https://resocoder.com/2019/10/21/flutter-tdd-clean-architecture-course-13-dependency-injection-user-interface/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/core/boxes.dart';
import 'package:my_ecommerce/features/auth/application/user_bloc/user_bloc.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:my_ecommerce/features/wish_list/domain/usecases/remove_all_wish_list.dart';

import 'data/data_sources/cache_data_source.dart';
import 'data/data_sources/local_data_source.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/wish_list_repo_impl.dart';
import 'domain/entities/wish_list_products.dart';
import 'domain/repositories/wish_list_repo.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/bloc/wishlist_bloc.dart';

Future<void> wishListInjectionContainerSetup(GetIt sl) async {
//! Feature - Wish List
// Bloc
  sl.registerLazySingleton<WishlistBloc>(() => WishlistBloc(
      getAllWishListIdsUseCase: sl(),
      getAllWishListProductsUseCase: sl(),
      addWishListIdUseCase: sl(),
      removeAllUseCase: sl<RemoveAllUseCase>(),
      removeWishListIdUseCase: sl())
    ..add(const GetAllWishListIdsEvent()));
// useCases
  sl.registerLazySingleton(() => GetAllWishListIdsUseCase(sl()));
  sl.registerLazySingleton(() => AddToWishListUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromWishListUseCase(sl()));
  sl.registerLazySingleton(() => GetAllWishListProductsUseCase(sl()));
  sl.registerLazySingleton(() => RemoveAllUseCase(sl()));

// Repository
  sl.registerLazySingleton<WishListRepo>(() => WishListRepoImpl(
      // productBloc: sl<ProductBloc>(),
      // productCachedData: sl(),
      wishListIdsCachedData: sl(),
      productLocalDataSource: sl(),
      // connectionCheck: sl(),
      // idLocalDataSource: sl(),
      remoteDataSource: sl(),
      authBloc: sl(),
      checkInternetBloc: sl()));

// Data sources
// cacheDataSource
  // sl.registerLazySingleton(() => ProductCachedData(wishListProducts: sl()));
  sl.registerLazySingleton(() => const WishListIdsCachedData());
  sl.registerLazySingleton(() => WishListProducts());
//local
  // sl.registerLazySingleton(() => IdsLocalDataSourceHive(getWishListIDBox()));
  sl.registerLazySingleton(
      () => ProductsLocalDataSourceHive(getProductOfWishListBox()));
//remote
  sl.registerLazySingleton<AbstractRemoteDataSource>(() => RemoteDataSource(
        userBloc: sl<UserBloc>(),
        userCollectionRef: sl<CollectionReference<Object?>>(),
      ));
//! External -- packages
}
