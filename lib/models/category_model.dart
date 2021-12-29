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

  factory Category.fromDocumentSnapshot(DocumentSnapshot json) => Category(
        name: (json[nameCol] ?? " ") as String,
        imgUrl: (json[imageUrlCol] ?? " ") as String,
      );

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

  static const List<Category> list = [
    Category(
      name: 'paf',
      imgUrl:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ),
    Category(
      name: 'adel',
      imgUrl:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ),
    Category(
      name: 'colored pens',
      imgUrl:
          'https://stormbuildingproducts.com/app/uploads/2019/08/Picture5.jpg',
    ),
    Category(
      name:
          'the neow ama pro gfor th e dking night danm with his man on the roofka; fkayses it is',
      imgUrl:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ),
    Category(
      name: 'pen',
      imgUrl:
          'https://penworld.sirv.com/media/catalog/product/1/9/1931673_1.jpg',
    ),
  ];

  @override
  List<Object> get props => [_imgUrl, _id, _name];
}
