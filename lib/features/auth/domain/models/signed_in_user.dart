import 'dart:convert';

import 'package:my_ecommerce/features/wish_list/domain/entities/wish_list_id.dart';

class SignedInUser {
  final String name;
  final String email;
  final String id;
  final String phoneNumber;
  final List<String> allWishListIds;
  SignedInUser({
    required this.allWishListIds,
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumber,
  });

  // TODO not forget to create SignedInUser image

  SignedInUser copyWith({
    String? name,
    String? email,
    String? id,
    String? phoneNumber,
    List<String>? allWishListIds,
  }) {
    return SignedInUser(
      allWishListIds: allWishListIds ?? this.allWishListIds,
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignedInUser.fromJson(String source) =>
      SignedInUser.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap({bool disableId = false}) {
    final Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      "allWishListIds": List<dynamic>.from(allWishListIds.map((x) => x)),
    };
    // if you need to disable the id you need to make it true
    //so it will not added to fireStore
    if (!disableId) {
      map['id'] = id;
    }
    return map;
  }

  factory SignedInUser.fromMap(Map<String, dynamic> map) {
    // List<'YourModel'>.from(_list.where((i) => i.flag == true));
    return SignedInUser(
      allWishListIds: map["allWishListIds"] == null
          ? <String>[]
          : List<String>.from((map["allWishListIds"] as List).map((x) => x)),
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      id: (map['id'] ?? '') as String,
      phoneNumber: (map['phoneNumber'] ?? '') as String,
    );
  }

  Map<String, dynamic> setToFireBase() => toMap(disableId: true);

  factory SignedInUser.fromFireStore({
    required String id,
    required Map<String, dynamic> map,
  }) {
    map["id"] = id;
    return SignedInUser.fromMap(map);
  }
}
