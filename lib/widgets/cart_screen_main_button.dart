import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

class CartScreenMainButton extends StatelessWidget {
  const CartScreenMainButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 3),
      child: Text(
        buttonText, //TODO: langyage
        style: constButtonTextStyle,
      ),
    );
  }
}
