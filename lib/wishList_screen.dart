import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'models/models.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_bottom_app_bar.dart';
import 'widgets/product_card_widget/product_card_for_screens.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() => MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishListScreen(),
      );
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).cart),
      bottomNavigationBar: CustomBottmAppBar(),
      body: Container(
        child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          itemCount: Product.products.length,

          itemBuilder: (BuildContext context, int index) {
            Product currentProduct = Product.products[index];
            return ProductCardWidget(currentProduct: currentProduct);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          // shrinkWrap: true,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
