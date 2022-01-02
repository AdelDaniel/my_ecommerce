import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.height = 35,
      this.width = double.infinity,
      this.horizontalMargin = 10})
      : super(key: key);
  final double height;
  final double width;
  final double horizontalMargin;
  final void Function() onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainNavBarButton(
              onPressed: onPressed,
              buttonText: buttonText,
            )
          ],
        ),
      ),
    );
  }
}
