import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/constants/constants.dart';
import '../core/utils/curreny_converter.dart';
import '../features/cart/bloc/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Column(
            children: [
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: constMarginHerizontal, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SUBTOTAL',
                        style: Theme.of(context).textTheme.headline5),
                    Text(
                        "${CurrencyConverter.getCurrencySymbol(context)} ${CurrencyConverter.converPricetToString(state.cart.subTotal)}",
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: constMarginHerizontal, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('DELIVERY FEE',
                        style: Theme.of(context).textTheme.headline5),
                    Text(
                        "${CurrencyConverter.getCurrencySymbol(context)} ${CurrencyConverter.converPricetToString(state.cart.deliveryFee)}",
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "${CurrencyConverter.getCurrencySymbol(context)} ${CurrencyConverter.converPricetToString(state.cart.total)}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Text('Oops! Something went wrong!?');
        }
      },
    );
  }
}
