import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:my_ecommerce/models/models.dart';
import 'package:my_ecommerce/widgets/product_card_widget/product_availability_widget.dart';
import 'package:my_ecommerce/widgets/product_card_widget/product_rating.dart';

import 'package:transparent_image/transparent_image.dart';

import 'card_buttons.dart';
import 'product_card_image_and_discount.dart';
import 'product_first_category_name.dart';
import 'product_prices_widgets.dart';
import 'product_text_name.dart';

class MainScreenProductCardWidget extends StatelessWidget {
  const MainScreenProductCardWidget({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  final Product currentProduct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ProductCardImageAndDiscount(
                    imgUrl: currentProduct.imgUrl[0],
                    discount: currentProduct.discount),
              ),
              // ProductCardCarouselSlider(
              //     imgUrls: currentProduct.imgUrl),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                height: 40,
                alignment: AlignmentDirectional.centerStart,
                child: ProductTextName(productName: currentProduct.name),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Column(
                          children: [
                            ProductFirstCategoryName(
                                categoryName:
                                    currentProduct.category.first.name),
                            PriceWidget(productPrice: currentProduct.price),
                            OldPriceWidget(oldPrice: currentProduct.oldPrice),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 3),
                    ProductAvailabilityWidget(
                        isAvalible: currentProduct.isAvalible)
                  ],
                ),
              ),
              ProductRating(rating: currentProduct.rating),
              CardButtons()
            ],
          ),
        ),
      ),
    );
  }
}
