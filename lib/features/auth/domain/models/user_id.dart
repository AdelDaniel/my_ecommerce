import 'package:dartz/dartz.dart';

class UserID {
  final Option<String> value;

  factory UserID.fromFirebaseUniqueUserId(String uniqueUserId) {
    return UserID._(some(uniqueUserId));
  }
  String getUserIdOrCrash() {
    return value.fold(() => throw Error(), id);
  }

  const UserID._(this.value);
}
