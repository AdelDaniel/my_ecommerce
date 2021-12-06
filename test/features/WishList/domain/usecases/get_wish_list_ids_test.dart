import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/WishList/domain/entities/wish_list_ids.dart';
import 'package:my_ecommerce/features/WishList/domain/repositories/wish_list_repo.dart';
import 'package:my_ecommerce/features/WishList/domain/usecases/get_wish_list_ids.dart';
import '../../../../test_constants.dart';
import 'get_wish_list_ids_test.mocks.dart';

// class MockWishListRepo extends Mock implements WishListRepo{}
@GenerateMocks([WishListRepo])
void main() {
  late GetWishListIdsUseCase getWishListIdsUseCase;
  late MockWishListRepo mockWishListRepo;

  setUp(() {
    mockWishListRepo = MockWishListRepo();
    getWishListIdsUseCase = GetWishListIdsUseCase(mockWishListRepo);
  });

  test(
      'Should return Left(ServerFailure()) when call getWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.getWishListIds())
        .thenAnswer((_) async => const Left(ServerFailure()));
    // act
    final actualResult = await getWishListIdsUseCase();
    // assertion
    expect(actualResult, const Left(ServerFailure()));
  });

  test(
      'Should return Left(CacheFailure()) when call getWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.getWishListIds())
        .thenAnswer((_) async => const Left(CacheFailure()));
    // act
    final actualResult = await getWishListIdsUseCase();
    // assertion
    expect(actualResult, const Left(CacheFailure()));
  });

  test(
      'Should return Right(WishListIds(tIdsList)) when call getWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.getWishListIds())
        .thenAnswer((_) async => const Right(WishListIds(ids: tIdsList)));
    // act
    final actualResult = await getWishListIdsUseCase();
    // assertion
    expect(actualResult, const Right(WishListIds(ids: tIdsList)));
  });
}
