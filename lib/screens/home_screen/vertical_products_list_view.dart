import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../models/models.dart';

import 'home_screen_product_card_widget.dart';

class VerticalProductsListView extends StatelessWidget {
  const VerticalProductsListView({Key? key, required this.products})
      : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final Product currentProduct = products[index];
          return HomeScreenProductCardWidget(currentProduct: currentProduct);
        },
      ),
    );
  }
}
