import 'package:dartz/dartz.dart';

import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_object.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_validators.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Password(String value) {
    // will return the private constructor
    // and it's value the returned from validation.
    return Password._(validatePassword(value));
  }

  const Password._(this.value);
}
