import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/cart/bloc/cart_bloc.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          Positioned(
            right: 4,
            top: 2,
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                  border: Border.all(color: Colors.white),
                ),
                constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadedState) {
                      return FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          '${state.cart.productsNumberInCart}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      );
                    }
                    return const Text("0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white));
                  },
                )),
          )
        ],
      ),
    );
  }
}
