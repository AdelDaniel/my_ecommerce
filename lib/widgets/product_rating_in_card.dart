import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/constants/constants.dart';

class ProductRatingInCard extends StatelessWidget {
  final double rating;
  const ProductRatingInCard({Key? key, this.rating = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      height: 20,
      child: FittedBox(
        child: Row(
          children: [
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.yellowAccent[400],
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            ),
            Text(
              ' (${rating.toStringAsFixed(2)})',
              style: constLabelTextStyle.copyWith(
                  fontSize: 25, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
