import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_ecommerce/core/error/exceptions.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/core/networking/network.dart';
import 'package:my_ecommerce/features/WishList/data/datasources/local_data_source.dart';
import 'package:my_ecommerce/features/WishList/data/datasources/remote_data_source.dart';
import 'package:my_ecommerce/features/WishList/data/repositories/wish_list_repo_impl.dart';

import '../../../../test_constants.dart';
import 'wish_list_repo_impl_test.mocks.dart';

@GenerateMocks(
    [AbstractRemoteDataSource, AbstractLocalDataSource, AbstractNetworkInfo])
void main() {
  late WishListRepoImpl wishListRepoImpl;
  late MockAbstractRemoteDataSource mockRemoteDataSource;
  late MockAbstractLocalDataSource mockLocalDataSource;
  late MockAbstactNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockAbstractRemoteDataSource();
    mockLocalDataSource = MockAbstractLocalDataSource();
    mockNetworkInfo = MockAbstactNetworkInfo();
    wishListRepoImpl = WishListRepoImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      checkInternet: mockNetworkInfo,
    );
  });

  void _setUpcheckInternetIsTrue() =>
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  void _setUpcheckInternetIsFalse() =>
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

  group('getWishListIds().. ', () {
    group('checkInternet.isConnected= true..', () {
      setUp(() => _setUpcheckInternetIsTrue());
      test('should return Right(tWishListIds) ', () async {
        //arrange
        when(mockRemoteDataSource.getWishListIds())
            .thenAnswer((_) async => tWishListIds);
        // act
        final actualResult = await wishListRepoImpl.getWishListIds();
        // assert
        verify(mockRemoteDataSource.getWishListIds());
        expect(actualResult, const Right(tWishListIds));
      });
      test('should return Left(ServerFailure()) ', () async {
        //arrange
        when(mockRemoteDataSource.getWishListIds())
            .thenThrow(const ServerException());
        // act
        final actualResult = await wishListRepoImpl.getWishListIds();
        // assert
        verify(mockRemoteDataSource.getWishListIds());
        expect(actualResult, const Left(ServerFailure()));
      });
    });

    group('checkInternet.isConnected= false..', () {
      setUp(() => _setUpcheckInternetIsFalse());

      test('should return Right(tWishListIds) ', () async {
        //arrange
        when(mockLocalDataSource.getWishListIds())
            .thenAnswer((_) async => tWishListIds);
        // act
        final actualResult = await wishListRepoImpl.getWishListIds();
        // assert
        verify(mockLocalDataSource.getWishListIds());
        expect(actualResult, const Right(tWishListIds));
      });
      test('should return Left(CacheFailure()) ', () async {
        //arrange
        when(mockLocalDataSource.getWishListIds())
            .thenThrow(const CacheException());
        // act
        final actualResult = await wishListRepoImpl.getWishListIds();
        // assert
        verify(mockLocalDataSource.getWishListIds());
        expect(actualResult, const Left(CacheFailure()));
      });
    });
  });

  group('updateWishListIds().. ', () {
    group('checkInternet.isConnected= true..', () {
      setUp(() => _setUpcheckInternetIsTrue());

      test('should return Right(true) ', () async {
        // arrange
        when(mockRemoteDataSource.updateWishListIds(id: testId))
            .thenAnswer((_) async => true);
        when(mockLocalDataSource.updateWishListIds(id: testId))
            .thenAnswer((_) async => true);
        // act
        final actualResult =
            await wishListRepoImpl.updateWishListIds(id: testId);
        // assert
        verify(mockRemoteDataSource.updateWishListIds(id: testId));
        verify(mockLocalDataSource.updateWishListIds(id: testId));
        expect(actualResult, const Right(true));
      });

      test('should return Left(ServerFailure()) ', () async {
        // arrange
        when(mockRemoteDataSource.updateWishListIds(id: testId))
            .thenThrow(const ServerException());
        when(mockLocalDataSource.updateWishListIds(id: testId))
            .thenAnswer((_) async => true);
        // act
        final actualResult =
            await wishListRepoImpl.updateWishListIds(id: testId);
        // assert
        verify(mockRemoteDataSource.updateWishListIds(id: testId));
        verifyNever(mockLocalDataSource.updateWishListIds(id: testId));
        expect(actualResult, const Left(ServerFailure()));
      });

      test('should return Left(CacheFailure()) ', () async {
        // arrange
        when(mockRemoteDataSource.updateWishListIds(id: testId))
            .thenAnswer((_) async => true);
        when(mockLocalDataSource.updateWishListIds(id: testId))
            .thenThrow(const CacheException());
        // act
        final actualResult =
            await wishListRepoImpl.updateWishListIds(id: testId);
        // assert
        verify(mockRemoteDataSource.updateWishListIds(id: testId));
        verify(mockLocalDataSource.updateWishListIds(id: testId));
        expect(actualResult, const Left(CacheFailure()));
      });
    });

    group('checkInternet.isConnected= false..', () {
      setUp(() => _setUpcheckInternetIsFalse());
      test('should return Left(NoInternetFailure()) ', () async {
        // act
        final actualResult =
            await wishListRepoImpl.updateWishListIds(id: testId);
        // assert
        verifyNever(mockRemoteDataSource.updateWishListIds(id: testId));
        verifyNever(mockLocalDataSource.updateWishListIds(id: testId));
        expect(actualResult, const Left(NoInternetFailure()));
      });
    });
  });
}
