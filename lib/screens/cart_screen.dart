import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_ecommerce/features/cart/bloc/cart_bloc.dart';
import 'package:my_ecommerce/screens/checkout_screen.dart';

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
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return state.cart.cartItems.isEmpty
                  ? const SizedBox()
                  : CustomNavBar(
                      onPressed: () => Navigator.pushNamed(
                          context, CheckoutScreen.routeName),
                      buttonText: 'GO TO CHECKOUT', //TODO: language
                    );
            }
            return Container();
          },
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
