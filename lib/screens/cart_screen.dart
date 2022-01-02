import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/widgets.dart';

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
        bottomNavigationBar: CustomNavBar(
          onPressed: () => Navigator.pushNamed(context, '/checkout'),
          buttonText: 'GO TO CHECKOUT', //TODO: language
        ),
        body: Column(
          children: [
            // ! Upper :: the row to add more items || see delivery fee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CartBadge(),
                // to order More Products
                MainNavBarButton(
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
