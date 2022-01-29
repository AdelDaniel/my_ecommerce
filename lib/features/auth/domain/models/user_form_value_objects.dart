import 'package:my_ecommerce/features/auth/domain/models/email_address.dart';
import 'package:my_ecommerce/features/auth/domain/models/name.dart';
import 'package:my_ecommerce/features/auth/domain/models/password.dart';
import 'package:my_ecommerce/features/auth/domain/models/phone_number.dart';

class UserFormValueObjects {
  final EmailAddress emailAddress;
  final Password password;
  final Name name;
  final PhoneNumber phoneNumber;
  UserFormValueObjects({
    required this.emailAddress,
    required this.name,
    required this.phoneNumber,
    required this.password,
  });

  UserFormValueObjects copyWith({
    EmailAddress? emailAddress,
    Name? name,
    PhoneNumber? phoneNumber,
    Password? password,
  }) {
    return UserFormValueObjects(
      emailAddress: emailAddress ?? this.emailAddress,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'UserFormValueObjects(emailAddress: $emailAddress, name: $name, phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserFormValueObjects &&
        other.emailAddress == emailAddress &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.password == password;
  }

  @override
  int get hashCode {
    return emailAddress.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        password.hashCode;
  }
}
