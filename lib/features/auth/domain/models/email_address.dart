import 'package:dartz/dartz.dart';

import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_object.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String value) {
    // will return the private constructor
    // and it's value the returned from validation.
    return EmailAddress._(validateEmailAddress(value));
  }

  const EmailAddress._(this.value);
}
