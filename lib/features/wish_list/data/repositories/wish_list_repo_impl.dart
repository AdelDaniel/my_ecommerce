import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/error/errors.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/internet_connection/bloc/internet_connection_bloc.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/network.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';

import '../../../../all_injection_containers.dart';
import '../../../../core/error/failure.dart';
import '../../../../models/models.dart';
import '../../domain/entities/wish_list_id.dart';
import '../../domain/entities/wish_list_products.dart';
import '../../domain/repositories/wish_list_repo.dart';
import '../data_sources/cache_data_source.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';

class WishListRepoImpl extends WishListRepo {
  static bool _isAuthenticated = false;
  static bool _isConnected = false;

  factory WishListRepoImpl({
    required AbstractRemoteDataSource remoteDataSource,
    // required ProductBloc productBloc,
    // required IdsLocalDataSourceHive idLocalDataSource,
    required ProductsLocalDataSourceHive productLocalDataSource,
    required InternetConnectionBloc checkInternetBloc,

    // required ProductCachedData productCachedData,
    required WishListIdsCachedData wishListIdsCachedData,
    required AuthBloc authBloc,
    // required ConnectivityPlusNetworkInfoRepository connectionCheck,
  }) {
    // to listen every time when the authentication state changes
    // TODO :: check first if not initial ??
    checkInternetBloc.stream.listen((event) {
      _isConnected = event.isConnected;
    });
    authBloc.stream.listen((AuthState authState) {
      log("listen to authState.isAuthenticated at WishListRepoImpl= ${authState.isAuthenticated}");
      _isAuthenticated = authState.isAuthenticated;
    });

    return WishListRepoImpl._(
        // authBloc: authBloc,
        wishListIdsCachedData: wishListIdsCachedData,
        // checkInternetBloc: checkInternetBloc,
        // productBloc: productBloc,
        productLocalDataSource: productLocalDataSource,
        remoteDataSource: remoteDataSource);
  }
  const WishListRepoImpl._({
    required AbstractRemoteDataSource remoteDataSource,
    // required IdsLocalDataSourceHive idLocalDataSource,
    required ProductsLocalDataSourceHive productLocalDataSource,
    // required ProductBloc productBloc,
    // required InternetConnectionBloc checkInternetBloc,
    // required ProductCachedData productCachedData,
    required WishListIdsCachedData wishListIdsCachedData,
    // required AuthBloc authBloc,
  })  : _remoteDataSource = remoteDataSource,
        // _productBloc = productBloc,
        // _authBloc = authBloc,
        // _idLocalDataSource = idLocalDataSource,
        // _checkInternetBloc = checkInternetBloc,
        _productLocalDataSource = productLocalDataSource,
        // _productCachedData = productCachedData,
        _wishListIdsCachedData = wishListIdsCachedData;

  final AbstractRemoteDataSource _remoteDataSource;
  // final InternetConnectionBloc _checkInternetBloc;

  final ProductsLocalDataSourceHive _productLocalDataSource;
  // final IdsLocalDataSourceHive _idLocalDataSource;
  // final ProductCachedData _productCachedData;
  final WishListIdsCachedData _wishListIdsCachedData;
  // final ProductBloc _productBloc;

  @override
  Future<Either<Failure, List<String>>> getAllWishListIds() async {
    try {
      final Option<Failure> optionFailure = _checkBeforeImplementation();
      if (optionFailure.isSome()) {
        return Left(optionFailure.getOrElse(() {
          return const UnExpectedFailure(
            detailedMsg: "unKnown WishList Implementation error!",
          );
        }));
      }

      // if No data Exist in the cache >> then get it form local and save it to cache
      if (_wishListIdsCachedData.isEmpty) {
        final List<String> allWishListString =
            await _remoteDataSource.getAllWishListIds();
        _wishListIdsCachedData.updateWishListIDsFromString(allWishListString);
        return Right(_wishListIdsCachedData.allWishListIDs);
      } else {
        // there is a data already in the cache and don't need to get it from local
        return Right(_wishListIdsCachedData.allWishListIDs);
      }

      //  //if No data Exist in the cache >> then get it form local and save it to cache
      // if (_wishListIdsCachedData.isEmpty) {
      //   final localResult = await _idLocalDataSource.getAllWishList();
      //   _wishListIdsCachedData.allWishListIDs = localResult;
      //   return Right(localResult);
      // } else {
      //   // there is a data already in the cache and don't need to get it from local
      //   return Right(_wishListIdsCachedData.allWishListIDs);
      // }

    } on Exception catch (e) {
      return Left(_exceptionHandler(e));
    }
  }

  @override
  Future<Either<Failure, WishListProducts>> getAllWishListProducts() async {
    try {
      final WishListProducts wishListProducts = sl<WishListProducts>()
        ..updateList(await _productLocalDataSource.getAllWishList());
      return Right(wishListProducts);
      // return Right(WishListProducts(
      //     products: await _productLocalDataSource.getAllWishList()));

    } on Exception catch (e) {
      return Left(_exceptionHandler(e));
    }
  }

// add product id to fireBase
// add to locally user wishList (product list)
// save the local
  @override
  Future<Either<Failure, List<String>>> addToWishList({
    required Product product,
  }) async {
    final Option<Failure> optionFailure = _checkBeforeImplementation();
    if (optionFailure.isSome()) {
      return Left(optionFailure.getOrElse(() {
        return const UnExpectedFailure(
          detailedMsg: "unKnown WishList Implementation error!",
        );
      }));
    }
    log("addWishListId impl repo ");
    try {
      // save to remote fireStore
      await _remoteDataSource.addWishListId(productId: product.id);
      // update the current cached products loaded from firestore using ProductBloc
      _productLocalDataSource.addToWishList(value: product);
      // update the current list of products
      // _productBloc.productAddedToWishList(product);
      // save at cache
      return right(_wishListIdsCachedData.addToWishList(value: product));

      // _productCachedData.addToWishList(value: product);
      // _wishListIdsCachedData.addToWishList(value: product);
      // _idLocalDataSource.addToWishList(value: WishListID(id: product.id));
      // _productLocalDataSource.addToWishList(value: product);
      // return Right(_wishListIdsCachedData.allWishListIDs);

    } on Exception catch (e) {
      return Left(_exceptionHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> removeFromWishList(
      {required Product product}) async {
    try {
      final Option<Failure> optionFailure = _checkBeforeImplementation();
      if (optionFailure.isSome()) {
        return Left(optionFailure.getOrElse(() {
          return const UnExpectedFailure(
            detailedMsg: "unKnown WishList Implementation error!",
          );
        }));
      }

      // save to remote fireStore
      await _remoteDataSource.removeWishListId(productId: product.id);
      // update the current cached products loaded from firestore using ProductBloc
      _productLocalDataSource.removeFromWishList(value: product);
      // update the current list of products
      // _productBloc.productRemovedFromWishList(product);
      // save at cache
      return right(_wishListIdsCachedData.removeFromWishList(value: product));

      // _productCachedData.removeFromWishList(value: product);
      // _wishListIdsCachedData.removeFromWishList(value: product);
      // _idLocalDataSource.removeFromWishList(value: WishListID(id: product.id));
      // _productLocalDataSource.removeFromWishList(value: product);
      // return Right(_wishListIdsCachedData.allWishListIDs);

    } on Exception catch (e) {
      return Left(_exceptionHandler(e));
    }
  }

  @override
  Future<Either<Failure, void>> removeAllWishList() async {
    try {
      final Option<Failure> optionFailure = _checkBeforeImplementation();
      if (optionFailure.isSome()) {
        return Left(optionFailure.getOrElse(() {
          return const UnExpectedFailure(
            detailedMsg: "unKnown WishList Implementation error!",
          );
        }));
      }
      return const Left(UserAuthenticationFailure(detailedMsg: "detailedMsg"));

      // _productCachedData.removeAllWishList();
      // _wishListIdsCachedData.removeAllWishList();
      // _idLocalDataSource.removeAll();
      // _productLocalDataSource.removeAll();
      // return const Right(null);
    } on Exception catch (e) {
      return Left(_exceptionHandler(e));
    }
  }

  Option<Failure> _checkBeforeImplementation() {
    log("_checkBeforeImplementation _isAuthenticated= $_isAuthenticated _isConnected=$_isConnected");
    if (!_isAuthenticated) {
      return Some(Failure.userAuthenticationFailure(
        detailedMsg: getMessage[messages.loginInOrSignUp]!,
      ));
    } else if (!_isConnected) {
      return const Some(Failure.noInternetFailure());
    } else {
      return const None();
    }
  }

  Failure _exceptionHandler(Exception e) {
    if (e is CacheException) {
      return CacheFailure(detailedMsg: e.detailedMsg);
    } else if (e is LocalException) {
      return LocalFailure(detailedMsg: e.detailedMsg);
    } else if (e is UserAuthenticationException) {
      return UserAuthenticationFailure(detailedMsg: e.detailedMsg);
    } else if (e is UnExceptedError) {
      return UnExpectedFailure(detailedMsg: e.toString());
    } else {
      return const UnExpectedFailure(
        detailedMsg: "unKnown WishList Implementation error!",
      );
    }
  }
}
