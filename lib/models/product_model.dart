import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// TODO need to update the category model to be the same as product
class Product {
  final String _id;
  final String _name;
  final String _dsecription;
  final List<String> _imgUrl;
  final double _price;
  final double _oldPrice;
  final double _discount;
  final double _rating;
  final List<String> _categoriesId;
  final int _soldTimes;
  final bool _isRecommended;
  final bool _isAvalible;
  final bool isWishListed;
  // final bool isWishListed;
  final DateTime _publishedTime;
  final int _allQuentity;
  Product(
      {required String id,
      required String name,
      required String dsecription,
      required List<String> imgUrl,
      required double price,
      double oldPrice = 0,
      double rating = 0,
      required List<String> categoriesId,
      required int soldTimes,
      required bool isRecommended,
      required bool isAvalible,
      this.isWishListed = false,
      DateTime? publishedTime,
      required int allQuentity})
      : _id = id,
        _name = name,
        _imgUrl = imgUrl,
        _price = price,
        _oldPrice = oldPrice,
        _categoriesId = categoriesId,
        _soldTimes = soldTimes,
        _isRecommended = isRecommended,
        _isAvalible = isAvalible,
        _publishedTime = publishedTime ?? DateTime.now(),
        _allQuentity = allQuentity,
        _dsecription = dsecription,
        _rating = rating,
        _discount = oldPrice <= 0 ? 0 : ((oldPrice - price) / oldPrice * 100);

  String get id => _id;
  String get name => _name;
  List<String> get imgUrl => _imgUrl;
  double get price => _price;
  double get oldPrice => _oldPrice;
  double get discount => _discount;
  double get rating => _rating;
  List<String> get categories => _categoriesId;
  bool get isRecommended => _isRecommended;
  bool get isAvalible => _isAvalible;
  DateTime get publishedTime => _publishedTime;
  int get soldTimes => _soldTimes;
  int get allQuentity => _allQuentity;
  String get dsecription => _dsecription;

  factory Product.fromJson(String str) =>
      Product.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: (data["id"] ?? " ") as String,
      name: (data["name"] ?? " ") as String,
      dsecription: (data["dsecription"] ?? " ") as String,
      imgUrl: List<String>.from((data["imgUrl"] ?? [" "]) as List),
      price: (data["price"] ?? 0.0) as double,
      oldPrice: (data["oldPrice"] ?? 0.0) as double,
      rating: (data["rating"] ?? 0.0) as double,
      categoriesId: List<String>.from((data["categoriesId"] ?? [" "]) as List),
      soldTimes: (data["soldTimes"] ?? 0) as int,
      isRecommended: (data["isRecommended"] ?? false) as bool,
      isAvalible: (data["isAvalible"] ?? false) as bool,
      // isWishListed: (data["isWishListed"] ?? false) as bool,
      publishedTime: data["publishedTime"] != null
          ? DateTime.parse(data["publishedTime"] as String)
          : DateTime.now(),
      allQuentity: (data["allQuentity"] ?? 0) as int,
    );
  }

  factory Product.fromDocumentSnapshot(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return Product.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "name": _name,
      "dsecription": _dsecription,
      "imgUrl": _imgUrl,
      "price": _price,
      "oldPrice": _oldPrice,
      "rating": _rating,
      "categoriesId": _categoriesId,
      "soldTimes": _soldTimes,
      "isRecommended": _isRecommended,
      "isAvalible": _isAvalible,
      "publishedTime": _publishedTime.toIso8601String(),
      "allQuentity": _allQuentity,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? dsecription,
    List<String>? imgUrl,
    double? price,
    double? oldPrice,
    double? rating,
    List<String>? categoriesId,
    int? soldTimes,
    bool? isRecommended,
    bool? isAvalible,
    bool? isWishListed,
    DateTime? publishedTime,
    int? allQuentity,
  }) =>
      Product(
        id: id ?? _id,
        name: name ?? _name,
        dsecription: dsecription ?? _dsecription,
        imgUrl: imgUrl ?? _imgUrl,
        price: price ?? _price,
        oldPrice: oldPrice ?? _oldPrice,
        rating: rating ?? _rating,
        categoriesId: categoriesId ?? _categoriesId,
        soldTimes: soldTimes ?? _soldTimes,
        isRecommended: isRecommended ?? _isRecommended,
        isAvalible: isAvalible ?? _isAvalible,
        isWishListed: isWishListed ?? this.isWishListed,
        publishedTime: publishedTime ?? _publishedTime,
        allQuentity: allQuentity ?? _allQuentity,
      );

  // @override
  // List<String> get props => [_id];
}
