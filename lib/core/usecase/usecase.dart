import 'package:dartz/dartz.dart';

import '../error/failure.dart';

/// The useCase only function:
/// Future<Either<Failure, T>> call({required Params params});
abstract class UseCase<T, Params> {
  const UseCase();
  Future<Either<Failure, T>> call({required Params params});
}
