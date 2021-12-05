import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToWishListButton extends StatelessWidget {
  const AddToWishListButton(
      {Key? key, required this.isWishListed, this.size = 24.0})
      : super(key: key);

  final double size;
  final bool isWishListed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          padding: const EdgeInsets.all(3),
          child: Icon(
            isWishListed
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color: Colors.pink,
            size: size,
          ),
        ));
  }
}
