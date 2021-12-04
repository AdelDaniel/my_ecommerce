import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ProductFirstCategoryName extends StatelessWidget {
  const ProductFirstCategoryName(
      {Key? key, required this.categoryName, this.textDirection})
      : super(key: key);

  final String categoryName;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(categoryName,
          // textDirection: textDirection,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: Colors.grey)),
    );
  }
}
