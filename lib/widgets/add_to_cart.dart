import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddToCart extends StatelessWidget {
  const AddToCart(
      {Key? key,
      this.height = 35,
      this.width = double.infinity,
      this.horizontalMargin = 10})
      : super(key: key);
  final double height;
  final double width;
  final double horizontalMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Material(
          type: MaterialType.button,
          elevation: 3,
          color: Colors.blue,
          shadowColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
              height: height,
              width: width,
              child: Center(
                  child: Text(
                '${AppLocalizations.of(context).addToCart} 🛒',
                softWrap: true,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
        ),
      ),
    );
  }
}
