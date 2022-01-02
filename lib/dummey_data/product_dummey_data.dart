import 'package:my_ecommerce/models/models.dart';

List<Product> products = [
  Product(
    id: "0",
    name: "Classic Watch Bronson Chronograph Brown Eco Leather Watch",
    dsecription: '''
   Sku: FS5855
Case Size: 44MM
Movement: Quartz Chronograph
Platform: 44MM BRONSON
Strap Material: Leather
Water Resistance: 5 ATM
Case Color: Smoke
Case Material: Stainless Steel
Dial Color: Gray
Strap Fashion Color: Brown
Interchangeable Compatibility: 22MM
Strap Width: 22MM
Closure: Single Prong Strap Buckle
Strap Inner Circumference: 200+/- 5MM Battery Type: SR920SW
''',
    imgUrl: [
      "https://fossil.scene7.com/is/image/FossilPartners/FS5855_main?\$sfcc_fos_large\$",
      "https://fossil.scene7.com/is/image/FossilPartners/FS5855_onwrist?\$sfcc_fos_large\$",
      "https://fossil.scene7.com/is/image/FossilPartners/FS5855_9L?\$sfcc_lifestyle_large\$",
    ],
    price: 149.00,
    categoriesId: [
      "AuZrDj6rnAwy52s9db3k",
    ],
    soldTimes: 5,
    isRecommended: true,
    isAvalible: true,
    allQuentity: 120,
  ),
  Product(
      id: '1',
      name: 'laser Jacket',
      imgUrl: const [
        'https://images-na.ssl-images-amazon.com/images/I/61bHcEu5JGL._AC_UL1024_.jpg'
      ],
      price: 500.0,
      oldPrice: 700.0,
      rating: 2,
      categoriesId: const ['AuZrDj6rnAwy52s9db3k'],
      soldTimes: 10,
      isRecommended: true,
      isAvalible: true,
      publishedTime: DateTime(2017, 9, 7, 17, 30),
      allQuentity: 13,
      dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
  Product(
      id: '2',
      name: 'laser Jacket',
      imgUrl: const [
        'https://ae01.alicdn.com/kf/H2680be17338d422e9805864eb8c8e0d33/Punk-skulls-motorcycle-leather-jacket-men-Laser-engraving-wings-moto-biker-jacket-men-s-Reticulate-embroidery.jpg'
      ],
      price: 850.0,
      oldPrice: 1200.0,
      rating: 3,
      categoriesId: const ['AuZrDj6rnAwy52s9db3k'],
      soldTimes: 2,
      isRecommended: false,
      isAvalible: true,
      publishedTime: DateTime(2017, 9, 7, 17, 30),
      allQuentity: 10,
      dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
  Product(
      id: '3',
      name: 'colored pens',
      imgUrl: const [
        'https://stormbuildingproducts.com/app/uploads/2019/08/Picture5.jpg'
      ],
      price: 2.5,
      oldPrice: 3.0,
      rating: 5,
      categoriesId: const ['mUobxqHm54MTC5flKBpy'],
      soldTimes: 5,
      isRecommended: true,
      isAvalible: false,
      publishedTime: DateTime(2021, 8, 22, 5, 36),
      allQuentity: 5,
      dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
  Product(
      id: '4',
      name:
          'The Chair Kings the neow ama pro gfor th e dking night danm with his man on the roofka; fkayses it is',
      imgUrl: const [
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
      ],
      price: 1700,
      oldPrice: 2000.0,
      categoriesId: const ['glaMKvB7SvisGaPjONSq'],
      soldTimes: 1,
      isRecommended: false,
      isAvalible: true,
      publishedTime: DateTime(2021, 8, 22, 5, 36),
      allQuentity: 3,
      dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
  Product(
      id: '5',
      name: 'pen',
      imgUrl: const [
        'https://penworld.sirv.com/media/catalog/product/1/9/1931673_1.jpg'
      ],
      price: 50.0,
      oldPrice: 60.0,
      rating: 1,
      categoriesId: const ['mUobxqHm54MTC5flKBpy'],
      soldTimes: 5,
      isRecommended: true,
      isAvalible: true,
      publishedTime: DateTime(2020, 2, 45, 13, 50),
      allQuentity: 7,
      dsecription: 'very Bad ;af;teh the onfa foertnt;afaf'),
  Product(
      id: '6',
      name: 'Tv',
      imgUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk9S0Wy7KCpFFArNscrNt679yovTWPZpbQ5w&usqp=CAU'
      ],
      price: 350.0,
      oldPrice: 400.0,
      rating: 6,
      categoriesId: const ['glaMKvB7SvisGaPjONSq', 'mUobxqHm54MTC5flKBpy'],
      soldTimes: 0,
      isRecommended: true,
      isAvalible: true,
      publishedTime: DateTime.now(),
      allQuentity: 5,
      dsecription: 'futue tv'),
  Product(
      id: '7',
      name: 'lollipop',
      imgUrl: const [
        'http://cdn.shopify.com/s/files/1/1696/6039/products/LA08115Lollipop-1oz-RainbowBlast_edit.jpg?v=1615239686'
      ],
      price: 1,

      // rating: 1,
      categoriesId: const ['JIsJ3KEtXvtXc4Gsj4rQ'],
      soldTimes: 0,
      isRecommended: true,
      isAvalible: true,
      publishedTime: DateTime(2021, 8, 1, 3, 30),
      allQuentity: 5,
      dsecription: 'how to make the baby happy in five minutes'),
  Product(
      id: '8',
      name: 'Apple MacBook Pro 13´´ M1/8GB/512GB SSD Laptop',
      imgUrl: const [
        'https://www.panaromabd.com/wp-content/uploads/2021/03/apple-macbook-pro-133-inch-retina-display-8-core-apple-m1-chip-with-8gb-ram-256gb-ssd-myd82-space-gray-3.jpg',
        'https://cdn.shopify.com/s/files/1/0471/6039/3896/files/macbook-pro-m1-istock-bd_480x480.jpg?v=1605039654',
        'https://m.media-amazon.com/images/I/31Xjk0pBGUL._AC_SS450_.jpg',
        'https://www.techinn.com/f/13787/137870852_2/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg'
      ],
      price: 2392500,
      rating: 4.3,
      categoriesId: const [
        'YPNSOhMtjviOA8sgugQ0',
        'glaMKvB7SvisGaPjONSq',
        'mUobxqHm54MTC5flKBpy'
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
