import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/constants.dart';
import 'product_aligment_circular_widget.dart';

class CircularRatingNumber extends StatelessWidget {
  const CircularRatingNumber({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return PrdouctDetailsCircularAlignment(
        alignment: Alignment.topRight,
        child: Text.rich(
          TextSpan(
              text: rating.toStringAsFixed(1),
              style: constLabelTextStyle,
              children: const <TextSpan>[
                TextSpan(text: ' ⭐', style: TextStyle(fontSize: 18)),
              ]),
          textDirection: TextDirection.ltr,
        ));
  }
}
