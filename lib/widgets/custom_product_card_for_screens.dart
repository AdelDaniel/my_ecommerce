import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/models.dart';
import '../screens/product_details_screen.dart';
import '../widgets/widgets.dart';

class CustomProductCardWidget extends StatelessWidget {
  const CustomProductCardWidget({Key? key, required this.currentProduct})
      : super(key: key);

  final Product currentProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,
          arguments: currentProduct),
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              ProductCardImageAndDiscount(
                  imageShimmerHeight: 100,
                  imgUrl: currentProduct.imgUrl[0],
                  discount: currentProduct.discount),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                alignment: AlignmentDirectional.centerStart,
                child: ProductName(productName: currentProduct.name),
              ),
              Container(
                  height: 70,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                      const SizedBox(width: 3),
                      ProductAvailabilityWidget(
                          isAvalible: currentProduct.isAvalible)
                    ],
                  )),
              ProductRatingInCard(rating: currentProduct.rating),
              const CardButtons()
            ],
          ),
        ),
      ),
    );
  }
}
