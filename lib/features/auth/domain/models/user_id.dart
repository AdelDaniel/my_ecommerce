import 'package:dartz/dartz.dart';

class ID {
  final Option<String> value;

  factory ID.fromFirebaseUniqueId(String uniqueId) {
    return ID._(some(uniqueId));
  }
  String getIdOrCrash() {
    return value.fold(() => throw Error(), id);
  }

  const ID._(this.value);
}
