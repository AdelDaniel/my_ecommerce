import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cart/bloc/cart_bloc.dart';
import 'cart_product_card.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartLoadedState) {
          log(" ${state.cart}");
          return ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: state.cart.cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return CartProductCard(cartItem: state.cart.cartItems[index]);
              });
        } else {
          return const Center(child: Text('Oops!. Something went Wrong!!!'));
        }
      },
    );
  }
}
