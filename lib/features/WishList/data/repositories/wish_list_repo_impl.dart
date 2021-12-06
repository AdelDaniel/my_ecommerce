import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/networking/network.dart';
import '../../domain/entities/wish_list_ids.dart';
import '../../domain/repositories/wish_list_repo.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class WishListRepoImpl extends WishListRepo {
  const WishListRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.checkInternet,
  });

  final AbstractRemoteDataSource remoteDataSource;
  final AbstractLocalDataSource localDataSource;
  final AbstractNetworkInfo checkInternet;

  @override
  Future<Either<Failure, WishListIds>> getWishListIds() async {
    if (await checkInternet.isConnected) {
      try {
        return Right(await remoteDataSource.getWishListIds());
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getWishListIds());
      } catch (e) {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> updateWishListIds({required String id}) async {
    if (await checkInternet.isConnected) {
      try {
        return Right(await remoteDataSource.updateWishListIds(id: id) &&
            await localDataSource.updateWishListIds(id: id));
      } on ServerException {
        return const Left(ServerFailure());
      } on CacheException {
        return const Left(CacheFailure());
      }
    } else {
      return const Left(NoInternetFailure());
    }
  }
}
