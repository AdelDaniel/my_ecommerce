import 'package:my_ecommerce/features/auth/domain/failures/value_failure.dart';

class UnExceptedValueError extends Error {
  final ValueFailure valueFailure;
  UnExceptedValueError({required this.valueFailure});

  @override
  String toString() {
    const String explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}
