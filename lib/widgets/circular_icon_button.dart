import 'package:flutter/material.dart';

import 'product_aligment_circular_widget.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(
      {Key? key,
      required this.icon,
      this.alignment = Alignment.center,
      this.onPressed})
      : super(key: key);

  final Alignment alignment;
  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return PrdouctDetailsCircularAlignment(
        alignment: alignment,
        height: 40,
        width: 40,
        boxShape: BoxShape.circle,
        child: IconButton(
          iconSize: 40,
          icon: icon,
          onPressed: onPressed,
        ));
  }
}
