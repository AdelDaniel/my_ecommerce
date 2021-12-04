import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/models.dart';
import '../../widgets/add_to_cart.dart';
import '../../widgets/add_to_wish_list_button.dart';
import '../../widgets/product_card_widget.dart';
import '../../widgets/product_name_widget.dart';
import '../product_details_screen.dart';

class HomeScreenProductCardWidget extends StatelessWidget {
  const HomeScreenProductCardWidget({Key? key, required this.currentProduct})
      : super(key: key);

  final Product currentProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,
          arguments: currentProduct),
      child: SizedBox(
        width: 170,
        child: Card(
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                //? Product Card Image And Discount
                SizedBox(
                  height: 100,
                  child: ProductCardImageAndDiscount(
                      imgUrl: currentProduct.imgUrl[0],
                      discount: currentProduct.discount),
                ),
                //? Product Name In Card
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  height: 40,
                  alignment: AlignmentDirectional.centerStart,
                  child: ProductName(productName: currentProduct.name),
                ),
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
                            child: Column(children: [
                              ProductFirstCategoryName(
                                  categoryName:
                                      currentProduct.category.first.name),
                              PriceWidget(productPrice: currentProduct.price),
                              OldPriceWidget(oldPrice: currentProduct.oldPrice),
                            ])),
                      ),
                      const SizedBox(width: 3),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductAvailabilityWidget(
                              isAvalible: currentProduct.isAvalible),
                          const AddToWishListButton(),
                        ],
                      )
                    ],
                  ),
                ),
                ProductRatingInCard(rating: currentProduct.rating),
                const AddToCart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
