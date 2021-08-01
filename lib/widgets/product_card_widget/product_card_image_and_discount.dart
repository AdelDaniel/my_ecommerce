import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCardImageAndDiscount extends StatelessWidget {
  const ProductCardImageAndDiscount(
      {Key? key, required this.imgUrl, this.discount = 0})
      : super(key: key);

  final String imgUrl;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: FadeInImage.memoryNetwork(
              fit: BoxFit.fill, placeholder: kTransparentImage, image: imgUrl),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.rotate(
            angle: 0,
            // origin: Offset(10, 10),
            child: discount == 0
                ? SizedBox()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                    color: Colors.red,
                    child: RotatedBox(
                        quarterTurns: 0,
                        child: Text(
                          '${AppLocalizations.of(context).discount} \n ${discount.toStringAsFixed(2)}%',
                          textAlign: TextAlign.center,
                        )),
                  ),
          ),
        ),
      ],
    );
  }
}
