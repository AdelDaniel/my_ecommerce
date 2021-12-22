import 'package:my_ecommerce/models/models.dart';

Product tProduct = Product(
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
  categories: [
    const Category(
        name: "watch ",
        imgUrl:
            "https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2018/02/10-Great-Horween-Watch-Straps-gear-patrol-lead-full-1.jpg?crop=1.00xw:0.749xh;0,0.131xh&resize=1200:*")
  ],
  soldTimes: 5,
  isRecommended: true,
  isAvalible: true,
  allQuentity: 120,
);
