import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'add_to_cart.dart';

import 'add_to_wish_list_button.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [AddToCart(), AddToWishListButton()],
    );
  }
}
