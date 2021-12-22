import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

import 'cart_screen_main_button.dart';

class GoToCheckoutButtonNavBar extends StatelessWidget {
  const GoToCheckoutButtonNavBar(
      {Key? key,
      this.height = 35,
      this.width = double.infinity,
      this.horizontalMargin = 10})
      : super(key: key);
  final double height;
  final double width;
  final double horizontalMargin;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CartScreenMainButton(
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              buttonText: 'GO TO CHECKOUT', //TODO: langyage
            )
          ],
        ),
      ),
    );
  }
}
