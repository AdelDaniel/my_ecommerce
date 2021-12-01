import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductFirstCategoryName extends StatelessWidget {
  const ProductFirstCategoryName({Key? key, required this.categoryName})
      : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(categoryName,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: Colors.grey)),
    );
  }
}
