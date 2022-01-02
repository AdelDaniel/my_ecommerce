import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  static const String nameCol = "name";
  static const String imageUrlCol = "imageUrl";
  static const String idCol = "id";
  final String _id;
  final String _name;
  final String _imgUrl;
  const Category({
    required String name,
    required String imgUrl,
    String id = "",
  })  : _id = id,
        _name = name,
        _imgUrl = imgUrl;

  String get name => _name;
  String get imgUrl => _imgUrl;

  factory Category.fromJson(String str) =>
      Category.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: (json[nameCol] ?? " ") as String,
        imgUrl: (json[imageUrlCol] ?? " ") as String,
      );

  factory Category.fromDocumentSnapshot(DocumentSnapshot doc) {
    final Map<String, dynamic> data;
    if (doc.data() != null) {
      data = doc.data()! as Map<String, dynamic>;
    } else {
      data = <String, dynamic>{};
    }
    return Category.fromMap(data);
  }

  Map<String, dynamic> toMap() => {nameCol: name, imageUrlCol: imgUrl};

  Category copyWith({
    String? id,
    String? name,
    String? imgUrl,
  }) =>
      Category(
        id: id ?? _id,
        name: name ?? _name,
        imgUrl: imgUrl ?? _imgUrl,
      );

  @override
  List<Object> get props => [_imgUrl, _id, _name];
}
