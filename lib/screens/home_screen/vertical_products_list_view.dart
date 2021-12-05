import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

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
          return CustomProductCardWidget(
            currentProduct: currentProduct,
            isCardFixedHeight: true,
            width: 170,
            imageHeight: 100,
          );
        },
      ),
    );
  }
}
