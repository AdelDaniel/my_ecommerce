import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'home_screen_category_carousel_slider.dart';
import 'vertical_products_list_view.dart';

// import 'widgets/product_card_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen(),
      );
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).title),
      bottomNavigationBar: const CustomBottmAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeadLine1(text: AppLocalizations.of(context).mostPopular),
            const HomeScreenCategoryCarouselSlider(categories: Category.list),
            CustomHeadLine1(text: AppLocalizations.of(context).recommended),
            VerticalProductsListView(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            CustomHeadLine1(text: AppLocalizations.of(context).mostRated),
            VerticalProductsListView(
              products: Product.products
                  .where((product) => product.rating >= 5)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
