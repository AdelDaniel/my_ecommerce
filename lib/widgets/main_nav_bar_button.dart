import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

class MainNavBarButton extends StatelessWidget {
  const MainNavBarButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.height = 20,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * 0.75, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 3),
      child: Text(
        buttonText, //TODO: langyage
        style: constButtonTextStyle,
      ),
    );
  }
}
