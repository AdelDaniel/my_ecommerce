import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String _converPricetToString(double number) {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final mathFunc = (Match match) => '${match[1]},';

  return number.toString().replaceAllMapped(reg, mathFunc);
  // return NumberFormat().format(number);
}

String _currencyName(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  var format = NumberFormat.simpleCurrency(locale: locale.toString());
  return format.currencyName ?? 'USD';
  // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
  // print("CURRENCY NAME ${format.currencyName}"); // USD
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.productPrice}) : super(key: key);
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: FittedBox(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: _converPricetToString(productPrice),
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text:
                        ' ${_currencyName(context) == 'EGP' ? AppLocalizations.of(context).egp : _currencyName(context)}',
                    style: Theme.of(context).textTheme.bodyText2),
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
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FittedBox(
        child: Text(
          '${_converPricetToString(oldPrice)} ${_currencyName(context)}',
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
