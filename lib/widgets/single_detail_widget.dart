import 'package:flutter/material.dart';

import 'product_aligment_circular_widget.dart';

class SingleDetailsWidget extends StatelessWidget {
  const SingleDetailsWidget(
      {Key? key, required this.detailName, required this.detailValue})
      : super(key: key);

  final String detailName;
  final Widget detailValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$detailName: '),
        PrdouctDetailsCircularAlignment(
            vertical: 4,
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: Alignment.centerLeft,
            child: detailValue),
      ],
    );
  }
}
