import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:my_ecommerce/core/error/failure.dart';
import 'package:my_ecommerce/features/WishList/domain/repositories/wish_list_repo.dart';
import 'package:my_ecommerce/features/WishList/domain/usecases/update_wish_list_ids.dart';

import '../../../../test_constants.dart';
import 'update_wish_list_ids_test.mocks.dart';

// class MockWishListRepo extends Mock implements WishListRepo{}
@GenerateMocks([WishListRepo])
void main() {
  late UpdateWishListIdsUseCase updateWishListIdsUseCase;
  late MockWishListRepo mockWishListRepo;

  setUp(() {
    mockWishListRepo = MockWishListRepo();
    updateWishListIdsUseCase = UpdateWishListIdsUseCase(mockWishListRepo);
  });

  test(
      'Should return Left(ServerFailure()) when call updateWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.updateWishListIds(id: testId))
        .thenAnswer((_) async => const Left(ServerFailure()));
    // act
    final actualResult = await updateWishListIdsUseCase(
        params: const WishListIdParams(id: testId));
    // assertion
    expect(actualResult, const Left(ServerFailure()));
  });

  test(
      'Should return Left(CacheFailure()) when call updateWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.updateWishListIds(id: testId))
        .thenAnswer((_) async => const Left(CacheFailure()));
    // act
    final actualResult = await updateWishListIdsUseCase(
        params: const WishListIdParams(id: testId));
    // assertion
    expect(actualResult, const Left(CacheFailure()));
  });

  test(
      'Should return Right(tIdsList) when call updateWishListIdsUseCase.call()',
      () async {
    // arrange
    when(mockWishListRepo.updateWishListIds(id: testId))
        .thenAnswer((_) async => const Right(true));
    // act
    final actualResult = await updateWishListIdsUseCase(
        params: const WishListIdParams(id: testId));
    // assertion
    expect(actualResult, const Right(true));
  });
}
