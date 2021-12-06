import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// The useCase only function:
/// Future<Either<Failure, T>> call({required Params params});
abstract class UseCase<T, Params> {
  const UseCase();
  Future<Either<Failure, T>> call({required Params params});
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => const [];
}
