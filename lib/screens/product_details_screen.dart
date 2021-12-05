import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../all_injection_containers.dart';
import '../core/constants.dart';
import '../core/utils/date_coverter.dart';

import '../models/product_model.dart';
import '../widgets/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/porduct-Details';
  static Route route(Product product) => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductDetailsScreen(product: product),
      );
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  //? upper half
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Stack(children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: ProductDetailsCarouselSlider(
                              productIdHeroAnimation: product.id,
                              imgUrls: product.imgUrl)),
                      const CustomBackButton(),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            CircularIconButton(
                                alignment: Alignment.topRight,
                                icon: const Icon(Icons.more_vert_outlined),
                                onPressed: () {}),
                            CircularRatingNumber(rating: product.rating),
                          ],
                        ),
                      )
                    ]),
                  ),
                  //? middle half {Product Name and like }
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: constMarginHerizontal),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                              textDirection: TextDirection.ltr,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductName(
                                  productName: product.name,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductFirstCategoryName(
                                    categoryName: product.category.first.name),
                              ]),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: AddToWishListButton(
                                size: 40, isWishListed: product.isWishListed)),
                      ],
                    ),
                  ),
                  //? Prduct Price and avalibilty
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: constMarginHerizontal),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ProductAvailabilityWidget(
                                alignment: Alignment.center,
                                isAvalible: product.isAvalible),
                            QuantityNumberText(quantity: product.allQuentity)
                          ],
                        ),
                        Column(children: [
                          PriceWidget(productPrice: product.price),
                          OldPriceWidget(oldPrice: product.oldPrice),
                        ]),
                      ],
                    ),
                  ),
                  //? description of the product
                  const Divider(),
                  Column(
                    children: [
                      CustomHeadLine1(
                          text:
                              AppLocalizations.of(context).productDescription),
                      ReadMore(text: product.dsecription),
                    ],
                  ),
                  //? More Deatials of the product
                  const Divider(),
                  ExpandablePanel(
                    header: CustomHeadLine1(
                        text: AppLocalizations.of(context).productDetails),
                    collapsed: const SizedBox(),
                    theme: const ExpandableThemeData(
                        hasIcon: true,
                        tapHeaderToExpand: true,
                        iconColor: Colors.blue),
                    expanded: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: constMarginHerizontal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SingleDetailsWidget(
                              detailName:
                                  AppLocalizations.of(context).datePublished,
                              detailValue: Text(
                                sl<DateConverter>()
                                    .timeAgoSinceDate(product.publishedTime),
                                style: constLabelTextStyle,
                              )),
                          SingleDetailsWidget(
                            detailName:
                                AppLocalizations.of(context).customerReviews,
                            detailValue:
                                ProductRatingInCard(rating: product.rating),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            //? fixed Add to cart Button
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Center(
                  child: AddToCart(
                      horizontalMargin: constMarginHerizontal, height: 50)),
            )
          ],
        ),
      ),
    );
  }
}
