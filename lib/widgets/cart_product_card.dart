import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../all_injection_containers.dart';
import '../core/constants/constants.dart';
import '../core/utils/curreny_converter.dart';
import '../features/cart/bloc/cart_bloc.dart';
import '../models/cart_model.dart';
import 'widgets.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: constMarginLeftRight),
      child: Row(
        children: [
          GetNetworkImageWidget(
              imgUrl: cartItem.product.imgUrl[0], width: 90, height: 110),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ProductName(productName: cartItem.product.name)),
                    // To Remove the product from cart
                    IconButton(
                      icon: const Icon(Icons.delete_rounded,
                          color: Colors.red, size: 25),
                      onPressed: () => context.read<CartBloc>().add(
                            RemoveProductFromCartEvent(cartItem: cartItem),
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityNumberText(quantity: cartItem.product.allQuentity),
                    FittedBox(
                      child: PriceWidget(
                          price: cartItem.product.price,
                          priceTheme: Theme.of(context).textTheme.headline5),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 120),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Total: ${sl<CurrencyConverter>().converPricetToString(cartItem.quantity * cartItem.product.price)}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is CartLoadedState) {
                            return Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle,
                                      color: Colors.blue, size: 25),
                                  onPressed: () => context.read<CartBloc>().add(
                                        DecreaseProductQuantityEvent(
                                            cartItem: cartItem),
                                      ),
                                ),
                                SizedBox(
                                  width: 18,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      '${cartItem.quantity}',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle,
                                      color: Colors.blue, size: 25),
                                  onPressed: () => context.read<CartBloc>().add(
                                        IncreaseProductQuantityEvent(
                                            cartItem: cartItem),
                                      ),
                                ),
                              ],
                            );
                          }
                          return const Text('!?');
                        },
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
