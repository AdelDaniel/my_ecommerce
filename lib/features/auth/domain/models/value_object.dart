import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_ecommerce/core/error/errors.dart';

import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;
  const ValueObject();

  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getValueOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnExceptedValueError(valueFailure: f), id);
  }

  Map<String, dynamic> toMap() {
    if (value.isRight()) {
      return {'right': value.fold((_) => null, (r) => r)};
    } else {
      return {'left': value.fold((l) => l, (_) => null)};
    }
  }

  @override
  String toString() => 'ValueObject(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
