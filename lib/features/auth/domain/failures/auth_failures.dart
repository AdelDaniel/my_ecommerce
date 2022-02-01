import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser({
    @Default("Cancelled!") String failMsg,
  }) = CancelledByUser;
  const factory AuthFailure.serverError({
    @Default("Server Error!") String failMsg,
  }) = ServerError;
  const factory AuthFailure.emailAlreadyInUse({
    @Default("Email Already In Use!") String failMsg,
  }) = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination({
    @Default("Invalid Email Or Password!") String failMsg,
  }) = InvalidEmailAndPasswordCombination;
  const factory AuthFailure.userNotSavedInFireStoreDataBase({
    @Default("User Not Saved Remotely!") String failMsg,
  }) = UserNotSavedInFireStoreDataBase;
}
