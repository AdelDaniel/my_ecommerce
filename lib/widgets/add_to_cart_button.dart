import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/constants/constants.dart';

import '../features/cart/bloc/cart_bloc.dart';
import '../models/models.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {Key? key,
      required this.product,
      this.height = 35,
      this.width = double.infinity,
      this.horizontalMargin = 10})
      : super(key: key);
  final double height;
  final double width;
  final double horizontalMargin;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 5),
      child: ElevatedButton(
        onPressed: () => context
            .read<CartBloc>()
            .add(AddProductToCartEvent(product: product)),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width, height),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 3),
        child: FittedBox(
          child: Text(
            '${AppLocalizations.of(context).addToCart} 🛒', //TODO: langyage
            style: constButtonTextStyle,
          ),
        ),
      ),
    );

    // Container(
    //   margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 5),
    //   child: Material(
    //     type: MaterialType.button,
    //     elevation: 3,
    //     color: Colors.blue,
    //     shadowColor: Theme.of(context).primaryColor,
    //     borderRadius: BorderRadius.circular(8),
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(8),
    //       splashColor: Colors.black54,
    //       highlightColor: Colors.black54,
    //       onTap: null,
    //       // () =>
    //       //  context
    //       //     .read<CartBloc>()
    //       //     .add(AddProductToCartEvent(product: product)),
    //       child: SizedBox(
    //           height: height,
    //           width: width,
    //           child: Center(
    //               child: Text(
    //             '${AppLocalizations.of(context).addToCart} 🛒',
    //             softWrap: true,
    //             style: constButtonTextStyle,
    //           ))),
    //     ),
    //   ),
    // );
  }
}
