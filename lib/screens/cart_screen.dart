import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/cart_badge.dart';
import '../widgets/cart_list_widget.dart';
import '../widgets/cart_screen_main_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/go_to_checkout_button_nav_bar.dart';
import '../widgets/order_summery.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen(),
      );
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context).cart),
        bottomNavigationBar: const GoToCheckoutButtonNavBar(),
        body: Column(
          children: [
            // ! Upper :: the row to add more items || see delivery fee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CartBadge(),
                // to order More Products
                CartScreenMainButton(
                  onPressed: () => Navigator.popAndPushNamed(context, '/'),
                  buttonText: 'Add More Items 🛒', //TODO: langyage
                ),
              ],
            ),
            const SizedBox(height: 10),
            //! Middel :: the all Products In the cart The
            //! Only the scroll Part
            const Expanded(child: CartListWidget()),
            //! Bottom :: Order Summery total fee
            const OrderSummary(),
          ],
        ));
  }
}
