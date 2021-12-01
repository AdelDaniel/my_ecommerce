import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/product_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../widgets/product_card_carousel_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/porduct';
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
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: const CustomBottmAppBar(),
      body: ProductCardCarouselSlider(
        imgUrls: product.imgUrl,
      ),
    );
  }
}
