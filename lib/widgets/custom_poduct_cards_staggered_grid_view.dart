import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/models.dart';
import 'custom_product_card_for_screens.dart';

class CustomPoductCardsStaggeredGridView extends StatelessWidget {
  const CustomPoductCardsStaggeredGridView({Key? key, required this.products})
      : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final Product currentProduct = products[index];
        return CustomProductCardWidget(currentProduct: currentProduct);
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
      // shrinkWrap: true,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}
