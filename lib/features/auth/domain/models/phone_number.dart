import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_object.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_validators.dart';

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory PhoneNumber(String value) {
    return PhoneNumber._(validatePhoneNumber(value));
  }

  const PhoneNumber._(this.value);
}
