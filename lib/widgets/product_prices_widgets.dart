import 'package:flutter/material.dart';

import '../../all_injection_containers.dart';
import '../../core/utils/curreny_converter.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.price,
    this.priceTheme,
    this.currencyTheme,
  }) : super(key: key);
  final double price;
  final TextStyle? priceTheme;
  final TextStyle? currencyTheme;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: FittedBox(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: sl<CurrencyConverter>().converPricetToString(price),
                    style: priceTheme ?? Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text: sl<CurrencyConverter>().currencyName(context),
                    style:
                        currencyTheme ?? Theme.of(context).textTheme.bodyText2),
              ],
            ),
          ),
        ));
  }
}

class OldPriceWidget extends StatelessWidget {
  const OldPriceWidget({
    Key? key,
    required this.oldPrice,
  }) : super(key: key);

  final double oldPrice;

  @override
  Widget build(BuildContext context) {
    return oldPrice == 0
        ? const SizedBox()
        : Align(
            alignment: AlignmentDirectional.centerStart,
            child: FittedBox(
              child: Text(
                '${sl<CurrencyConverter>().converPricetToString(oldPrice)} ${sl<CurrencyConverter>().currencyName(context)}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    color: Colors.grey[500]),
              ),
            ),
          );
  }
}
