import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';

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
      body: SingleChildScrollView(child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          //  LoadingProductState && LoadedProductState && ErrorProductState
          if (state is LoadedProductState) {
            return Column(
              children: [
                CustomHeadLine1(text: AppLocalizations.of(context).mostPopular),
                const HomeScreenCategoryCarouselSlider(),
                const CustomHeadLine1(text: "all"),
                VerticalProductsListView(products: state.products),
                CustomHeadLine1(text: AppLocalizations.of(context).recommended),
                VerticalProductsListView(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                ),
                CustomHeadLine1(text: AppLocalizations.of(context).mostRated),
                VerticalProductsListView(
                  products: state.products
                      .where((product) => product.rating >= 5)
                      .toList(),
                ),
              ],
            );
          } else if (state is LoadingProductState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text("someThing went wrong");
          }
        },
      )),
    );
  }
}
