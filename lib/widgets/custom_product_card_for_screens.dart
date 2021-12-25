import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/product_details_screen.dart';
import '../widgets/widgets.dart';

class CustomProductCardWidget extends StatelessWidget {
  const CustomProductCardWidget(
      {Key? key,
      required this.currentProduct,
      this.width,
      required this.isCardFixedHeight,
      this.imageHeight})
      : super(key: key);

  final Product currentProduct;
  final double? width;
  final bool isCardFixedHeight;

  /// if the imageHeight == null it will take as much as can
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,
          arguments: currentProduct),
      child: SizedBox(
        width: width, //TODO
        child: Card(
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                //? Product Card Image And Discount
                SizedBox(
                  height: imageHeight,
                  child: ProductCardImageAndDiscount(
                      productIdHeroAnimation: currentProduct.id,
                      imageShimmerHeight: 100,
                      imgUrl: currentProduct.imgUrl[0],
                      discount: currentProduct.discount),
                ),
                //? Product Name In Card
                Flexible(
                    flex: isCardFixedHeight ? 2 : 0, //Todo
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      alignment: AlignmentDirectional.centerStart,
                      child: ProductName(productName: currentProduct.name),
                    )),
                const SizedBox(height: 3),
                //? Product Availability and price and wishlist button Widget
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
                                        currentProduct.categories.first.name),
                                PriceWidget(price: currentProduct.price),
                                OldPriceWidget(
                                    oldPrice: currentProduct.oldPrice),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductAvailabilityWidget(
                                isAvalible: currentProduct.isAvalible),
                            AddToWishListButton(product: currentProduct),
                          ],
                        ),
                      ],
                    )),
                ProductRatingInCard(rating: currentProduct.rating),
                AddToCartButton(product: currentProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
