import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductName extends StatelessWidget {
  const ProductName(
      {Key? key,
      required this.productName,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w500})
      : super(key: key);

  final String productName;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, wordSpacing: 2),
    );
  }
}
