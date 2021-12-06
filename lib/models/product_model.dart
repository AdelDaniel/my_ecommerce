import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category_model.dart';

class Product extends Equatable {
  final String _id;
  final String _name;
  final String _dsecription;
  final List<String> _imgUrl;
  final double _price;
  final double _oldPrice;
  final double _discount;
  final double _rating;
  final List<Category> _category;
  final int _soldTimes;
  final bool _isRecommended;
  final bool _isAvalible;
  final bool _isWishListed;
  final DateTime _publishedTime;
  final int _allQuentity;
  const Product(
      {required String id,
      required String name,
      required String dsecription,
      required List<String> imgUrl,
      required double price,
      double oldPrice = 0,
      double rating = 0,
      required List<Category> category,
      required int soldTimes,
      required bool isRecommended,
      required bool isAvalible,
      required bool isWishListed,
      required DateTime publishedTime,
      required int allQuentity})
      : _id = id,
        _name = name,
        _imgUrl = imgUrl,
        _price = price,
        _oldPrice = oldPrice,
        _category = category,
        _soldTimes = soldTimes,
        _isRecommended = isRecommended,
        _isAvalible = isAvalible,
        _isWishListed = isWishListed,
        _publishedTime = publishedTime,
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
  List<Category> get category => _category;
  bool get isRecommended => _isRecommended;
  bool get isAvalible => _isAvalible;
  bool get isWishListed => _isWishListed;
  DateTime get publishedTime => _publishedTime;
  int get soldTimes => _soldTimes;
  int get allQuentity => _allQuentity;
  String get dsecription => _dsecription;

  factory Product.fromJson(String str) =>
      Product.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) {
    final List<Category> canvertCategoriesFromMap = [];
    if (json["category"] != null) {
      json["category"].forEach((String value) {
        canvertCategoriesFromMap.add(Category.fromJson(value));
      });
    }
    return Product(
      id: (json["id"] ?? " ") as String,
      name: (json["name"] ?? " ") as String,
      dsecription: (json["dsecription"] ?? " ") as String,
      imgUrl: (json["imgUrl"] != null ? json["imgUrl"].cast<String>() : [])
          as List<String>,
      price: (json["price"] ?? " ") as double,
      oldPrice: (json["oldPrice"] ?? 0) as double,
      rating: (json["rating"] ?? " ") as double,
      category: canvertCategoriesFromMap,
      soldTimes: (json["soldTimes"] ?? 0) as int,
      isRecommended: (json["isRecommended"] ?? false) as bool,
      isAvalible: (json["isAvalible"] ?? false) as bool,
      isWishListed: (json["isWishListed"] ?? false) as bool,
      publishedTime: (json["publishedTime"] ?? DateTime.now()) as DateTime,
      allQuentity: (json["allQuentity"] ?? 0) as int,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "dsecription": dsecription,
        "imgUrl": imgUrl,
        "price": price,
        "oldPrice": oldPrice,
        "rating": rating,
        "category": category,
        "soldTimes": soldTimes,
        "isRecommended": isRecommended,
        "isAvalible": isAvalible,
        "isWishListed": isWishListed,
        "publishedTime": publishedTime,
        "allQuentity": allQuentity,
      };

  static List<Product> products = [
    Product(
        id: '1',
        isWishListed: false,
        name: 'laser Jacket',
        imgUrl: const [
          'https://images-na.ssl-images-amazon.com/images/I/61bHcEu5JGL._AC_UL1024_.jpg'
        ],
        price: 500.0,
        oldPrice: 700.0,
        rating: 2,
        category: const [
          Category(
              name: 'clothes',
              imgUrl:
                  'https://images-na.ssl-images-amazon.com/images/I/61bHcEu5JGL._AC_UL1024_.jpg')
        ],
        soldTimes: 10,
        isRecommended: true,
        isAvalible: true,
        publishedTime: DateTime(2017, 9, 7, 17, 30),
        allQuentity: 13,
        dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
    Product(
        isWishListed: false,
        id: '2',
        name: 'laser Jacket',
        imgUrl: const [
          'https://ae01.alicdn.com/kf/H2680be17338d422e9805864eb8c8e0d33/Punk-skulls-motorcycle-leather-jacket-men-Laser-engraving-wings-moto-biker-jacket-men-s-Reticulate-embroidery.jpg'
        ],
        price: 850.0,
        oldPrice: 1200.0,
        rating: 3,
        category: const [
          Category(
              name: 'clothes',
              imgUrl:
                  'https://ae01.alicdn.com/kf/H2680be17338d422e9805864eb8c8e0d33/Punk-skulls-motorcycle-leather-jacket-men-Laser-engraving-wings-moto-biker-jacket-men-s-Reticulate-embroidery.jpg')
        ],
        soldTimes: 2,
        isRecommended: false,
        isAvalible: true,
        publishedTime: DateTime(2017, 9, 7, 17, 30),
        allQuentity: 10,
        dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
    Product(
        isWishListed: false,
        id: '3',
        name: 'colored pens',
        imgUrl: const [
          'https://stormbuildingproducts.com/app/uploads/2019/08/Picture5.jpg'
        ],
        price: 2.5,
        oldPrice: 3.0,
        rating: 5,
        category: const [
          Category(
            name: 'colored pens',
            imgUrl:
                'https://stormbuildingproducts.com/app/uploads/2019/08/Picture5.jpg',
          )
        ],
        soldTimes: 5,
        isRecommended: true,
        isAvalible: false,
        publishedTime: DateTime(2021, 8, 22, 5, 36),
        allQuentity: 5,
        dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
    Product(
        isWishListed: true,
        id: '4',
        name:
            'The Chair Kings the neow ama pro gfor th e dking night danm with his man on the roofka; fkayses it is',
        imgUrl: const [
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
        ],
        price: 1700,
        oldPrice: 2000.0,
        category: const [
          Category(
            name:
                'The Chair Kings the neow ama pro gfor th e dking night danm with his man on the roofka; fkayses it is',
            imgUrl:
                'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          )
        ],
        soldTimes: 1,
        isRecommended: false,
        isAvalible: true,
        publishedTime: DateTime(2021, 8, 22, 5, 36),
        allQuentity: 3,
        dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
    Product(
        isWishListed: false,
        id: '5',
        name: 'pen',
        imgUrl: const [
          'https://penworld.sirv.com/media/catalog/product/1/9/1931673_1.jpg'
        ],
        price: 50.0,
        oldPrice: 60.0,
        rating: 1,
        category: const [
          Category(
            name: 'pen',
            imgUrl:
                'https://penworld.sirv.com/media/catalog/product/1/9/1931673_1.jpg',
          )
        ],
        soldTimes: 5,
        isRecommended: true,
        isAvalible: true,
        publishedTime: DateTime(2020, 2, 45, 13, 50),
        allQuentity: 7,
        dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
    Product(
        isWishListed: true,
        id: '6',
        name: 'Tv',
        imgUrl: const [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9S0Wy7KCpFFArNscrNt679yovTWPZpbQ5w&usqp=CAU'
        ],
        price: 350.0,
        oldPrice: 400.0,
        rating: 6,
        category: const [
          Category(
            name: 'Tv',
            imgUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9S0Wy7KCpFFArNscrNt679yovTWPZpbQ5w&usqp=CAU',
          )
        ],
        soldTimes: 0,
        isRecommended: true,
        isAvalible: true,
        publishedTime: DateTime.now(),
        allQuentity: 5,
        dsecription: 'futue tv'),
    Product(
        isWishListed: false,
        id: '7',
        name: 'lollipop',
        imgUrl: const [
          'http://cdn.shopify.com/s/files/1/1696/6039/products/LA08115Lollipop-1oz-RainbowBlast_edit.jpg?v=1615239686'
        ],
        price: 1,

        // rating: 1,
        category: const [
          Category(
            name: 'kid food',
            imgUrl:
                'http://cdn.shopify.com/s/files/1/1696/6039/products/LA08115Lollipop-1oz-RainbowBlast_edit.jpg?v=1615239686',
          )
        ],
        soldTimes: 0,
        isRecommended: true,
        isAvalible: true,
        publishedTime: DateTime(2021, 8, 1, 3, 30),
        allQuentity: 5,
        dsecription: 'how to make the baby happy in five minutes'),
    Product(
        id: '8',
        isWishListed: false,
        name: 'Apple MacBook Pro 13´´ M1/8GB/512GB SSD Laptop',
        imgUrl: const [
          'https://www.panaromabd.com/wp-content/uploads/2021/03/apple-macbook-pro-133-inch-retina-display-8-core-apple-m1-chip-with-8gb-ram-256gb-ssd-myd82-space-gray-3.jpg',
          'https://cdn.shopify.com/s/files/1/0471/6039/3896/files/macbook-pro-m1-istock-bd_480x480.jpg?v=1605039654',
          'https://m.media-amazon.com/images/I/31Xjk0pBGUL._AC_SS450_.jpg',
          'https://www.techinn.com/f/13787/137870852_2/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg'
        ],
        price: 2392500,
        rating: 4.3,
        category: const [
          Category(
            name: 'Laptops',
            imgUrl:
                'data:image/jpeg;base64,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',
          )
        ],
        soldTimes: 1,
        isRecommended: true,
        isAvalible: true,
        publishedTime: DateTime(2021, 8, 1, 3, 30),
        allQuentity: 3,
        dsecription: '''
        APPLE MACBOOK PRO 13 INCH M1 CHIP WITH 8‑CORE CPU AND 8‑CORE GPU,8GB,512GB SSD SPACE GREY MYD92AB/A
Reference: MYD92AB/A
Processor M1
8 GB RAM
512 GB SSD
Graphics Controller Model: GPU 8-Core
Height: 1.56 CM *Length: 21.24 cm *Weight: 1.4 kg *Width: 30.41 cm
RE GPU,8GB,512GB SSD SPACE GREY MYD92AB/A
Reference: MYD92AB/A
Processor M1
8 GB RAM
512 GB SSD
Graphics Controller Model: GPU 8-Core
Height: 1.56 CM *Length: 21.24 cm *Weight: 1.4 kg *Width: 30.41 cm
'''),
  ];

  @override
  List<Object?> get props => [_id];
}
