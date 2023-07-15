// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:my_ecommerce/features/wish_list/presentation/bloc/wishlist_bloc.dart';

import '../widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishListScreen(),
      );
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).wishlist),
      bottomNavigationBar: const CustomBottmAppBar(),
      body: Builder(
        builder: (context) {
          // the products saved in hive have same ids
          // if i get the products itself and not it's ids only form hive
          // the product will not be the same in the rest of the app
          final productState = context.watch<ProductBloc>().state;
          final wishListState = context.watch<WishlistBloc>().state;

          if (wishListState is LoadingWishListState) {
            return const Center(child: CircularProgressIndicator());
          }
          //  else if (wishListState is LoadedWishListProductsState) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          else if (wishListState is LoadedWishListIdsState &&
              productState is LoadedProductState) {
            // TODO :Clean this
            final wishListedProducts = productState.products
                .where((product) => product.isWishListed)
                .toList();
            return CustomPoductCardsUsingStaggeredGridView(
                products: wishListedProducts);
          } else if (wishListState is ErrorWishListState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('some thing went wrong'),
                Text(wishListState.failure.mainMessage),
                Text(wishListState.failure.detailedMsg),
              ],
            ));
          } else if (wishListState is EmptyWishListState) {
            return const Center(
                child:
                    Text('No Products In Your Wish List Yet! ')); //TODO :: lang
          }
          return const Center(child: Text('some thing went wrong'));
        },
      ),
    );
  }
}
