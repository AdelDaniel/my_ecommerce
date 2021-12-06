import 'dart:convert';

import 'package:equatable/equatable.dart';

class WishListIds extends Equatable {
  static const String _jsonIdsName = "ids";
  const WishListIds({required this.ids});
  final List<String> ids;

  factory WishListIds.fromJson(String str) =>
      WishListIds.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory WishListIds.fromMap(Map<String, dynamic> json) => WishListIds(
        ids: (json[_jsonIdsName] != null
            ? json[_jsonIdsName].cast<String>()
            : []) as List<String>,
      );

  Map<String, dynamic> toMap() => {_jsonIdsName: ids};

  @override
  List<Object?> get props => [ids, ids.length];
}
