import 'package:equatable/equatable.dart';
import 'package:my_ecommerce/models/category_model.dart';

class Product extends Equatable {
  final int _id;
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
  final DateTime _publishedTime;
  final int _allQuentity;
  const Product(
      {required int id,
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
        _publishedTime = publishedTime,
        _allQuentity = allQuentity,
        _dsecription = dsecription,
        _rating = rating,
        _discount = oldPrice <= 0 ? 0 : ((oldPrice - price) / oldPrice * 100);

  int get id => _id;
  String get name => _name;
  List<String> get imgUrl => _imgUrl;
  double get price => _price;
  double get oldPrice => _oldPrice;
  double get discount => _discount;
  double get rating => _rating;
  List<Category> get category => _category;
  bool get isRecommended => _isRecommended;
  bool get isAvalible => _isAvalible;
  DateTime get publishedTime => _publishedTime;
  int get soldTimes => _soldTimes;
  int get allQuentity => _allQuentity;
  String get dsecription => _dsecription;

  static List<Product> products = [
    Product(
        id: 1,
        name: 'laser Jacket',
        imgUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61bHcEu5JGL._AC_UL1024_.jpg'
        ],
        price: 500.0,
        oldPrice: 700.0,
        rating: 2,
        category: [
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
        id: 2,
        name: 'laser Jacket',
        imgUrl: [
          'https://ae01.alicdn.com/kf/H2680be17338d422e9805864eb8c8e0d33/Punk-skulls-motorcycle-leather-jacket-men-Laser-engraving-wings-moto-biker-jacket-men-s-Reticulate-embroidery.jpg'
        ],
        price: 850.0,
        oldPrice: 1200.0,
        rating: 3,
        category: [
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
        id: 3,
        name: 'colored pens',
        imgUrl: [
          'https://stormbuildingproducts.com/app/uploads/2019/08/Picture5.jpg'
        ],
        price: 2.5,
        oldPrice: 3.0,
        rating: 5,
        category: [
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
        id: 4,
        name:
            'The Chair Kings the neow ama pro gfor th e dking night danm with his man on the roofka; fkayses it is',
        imgUrl: [
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
        ],
        price: 1700,
        oldPrice: 2000.0,
        rating: 0,
        category: [
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
        id: 5,
        name: 'pen',
        imgUrl: [
          'https://penworld.sirv.com/media/catalog/product/1/9/1931673_1.jpg'
        ],
        price: 50.0,
        oldPrice: 60.0,
        rating: 1,
        category: [
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
        id: 6,
        name: 'Tv',
        imgUrl: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9S0Wy7KCpFFArNscrNt679yovTWPZpbQ5w&usqp=CAU'
        ],
        price: 350.0,
        oldPrice: 400.0,
        rating: 6,
        category: [
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
        id: 7,
        name: 'lollipop',
        imgUrl: [
          'http://cdn.shopify.com/s/files/1/1696/6039/products/LA08115Lollipop-1oz-RainbowBlast_edit.jpg?v=1615239686'
        ],
        price: 1,
        oldPrice: 0,
        // rating: 1,
        category: [
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
        dsecription: 'futue tv'),
  ];

  @override
  List<Object?> get props => [_id];
}
