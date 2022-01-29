import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';
import 'package:my_ecommerce/features/auth/domain/models/value_object.dart';

class ID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ID.fromFirebaseUniqueId(String uniqueId) {
    return ID._(Right(uniqueId));
  }

  const ID._(this.value);
}
