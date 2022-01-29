import 'dart:convert';

class SignedInUser {
  final String name;
  final String email;
  final String id;
  final String phoneNumber;
  SignedInUser({
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumber,
  });

  // TODO not forget to create SignedInuser image

  SignedInUser copyWith({
    String? name,
    String? email,
    String? id,
    String? phoneNumber,
  }) {
    return SignedInUser(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'phoneNumber': phoneNumber,
    };
  }

  factory SignedInUser.fromMap(Map<String, dynamic> map) {
    return SignedInUser(
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      id: (map['id'] ?? '') as String,
      phoneNumber: (map['phoneNumber'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignedInUser.fromJson(String source) =>
      SignedInUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignedInUser(name: $name, email: $email, id: $id, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignedInUser &&
        other.name == name &&
        other.email == email &&
        other.id == id &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ id.hashCode ^ phoneNumber.hashCode;
  }
}
