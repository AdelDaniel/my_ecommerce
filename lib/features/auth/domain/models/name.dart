import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_object.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_validators.dart';

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Name(String value) {
    return Name._(validateName(value));
  }

  const Name._(this.value);
}
