import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @Default("Invalid Email!") String failMsg,
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @Default("Short Password < at least 6 characters!") String failMsg,
    required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.emptyField({
    @Default("Must Not Empty!") String failMsg,
    required T failedValue,
  }) = EmptyField<T>;
  const factory ValueFailure.invalidPhoneNumber({
    @Default("Invalid Phone Number!") String failMsg,
    required T failedValue,
  }) = InvalidPhoneNumber<T>;
}
