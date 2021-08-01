import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductTextName extends StatelessWidget {
  const ProductTextName({Key? key, required this.productName})
      : super(key: key);

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$productName',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w500, wordSpacing: 2),
    );
  }
}
