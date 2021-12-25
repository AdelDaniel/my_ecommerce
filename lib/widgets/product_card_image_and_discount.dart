// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'get_network_image_widget.dart';

class ProductCardImageAndDiscount extends StatelessWidget {
  const ProductCardImageAndDiscount(
      {Key? key,
      required this.imgUrl,
      required this.productIdHeroAnimation,
      this.discount = 0,
      this.imageShimmerHeight})
      : super(key: key);

  final String imgUrl;
  final double discount;
  final double? imageShimmerHeight;
  final String productIdHeroAnimation;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          // TODO :: Hero(tag: productIdHeroAnimation,
          child: GetNetworkImageWidget(
              imgUrl: imgUrl, shimmerHeight: imageShimmerHeight),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Transform.rotate(
            angle: 0, // -0.3,
            // origin: const Offset(-10, -5),
            child: discount == 0
                ? const SizedBox()
                : Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                    color: Colors.red,
                    child: RotatedBox(
                        quarterTurns: 0,
                        child: Text(
                          '${AppLocalizations.of(context).discount} \n ${discount.toStringAsFixed(1)}%',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        )),
                  ),
          ),
        ),
      ],
    );
  }
}
