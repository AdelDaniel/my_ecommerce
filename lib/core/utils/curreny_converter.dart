import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CurrencyConverter {
  const CurrencyConverter();
  static String converPricetToString(double number) {
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(Match match) => '${match[1]},';

    return number.toString().replaceAllMapped(reg, mathFunc);
    // return NumberFormat().format(number);
  }

  static String currencyName(BuildContext context) {
    final Locale locale = Localizations.localeOf(context);
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    if (format.currencyName == 'EGP') return AppLocalizations.of(context).egp;
    return format.currencyName ?? 'USD';
    // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    // print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  static String getCurrencySymbol(BuildContext context) {
    final Locale locale = Localizations.localeOf(context);
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }
}
