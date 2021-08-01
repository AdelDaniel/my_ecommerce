import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_ecommerce/models/models.dart';

import 'widgets/home_screen_carousel_slider.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_bottom_app_bar.dart';
import 'widgets/custom_headline1.dart';

import 'widgets/product_card_widget/main_screen_product_card_widget.dart';

// import 'widgets/product_card_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() => MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => HomeScreen(),
      );
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).title),
      bottomNavigationBar: CustomBottmAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeadLine1(text: AppLocalizations.of(context).mostPopular),
            HomeScreenCarouselSlider(categories: Category.list),
            CustomHeadLine1(text: AppLocalizations.of(context).recommended),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: Product.products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  Product currentProduct = Product.products[index];
                  return MainScreenProductCardWidget(
                      currentProduct: currentProduct);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
