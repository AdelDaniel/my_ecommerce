import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class PrdouctDetailsCircularAlignment extends StatelessWidget {
  const PrdouctDetailsCircularAlignment({
    Key? key,
    required this.child,
    this.alignment = Alignment.center,
    this.width = 55,
    this.height = 25,
    this.boxShape = BoxShape.rectangle,
    this.fit = BoxFit.contain,
    this.vertical = constMarginHerizontal,
  }) : super(key: key);

  final Alignment alignment;
  final double width;
  final double height;
  final BoxShape boxShape;
  final Widget child;
  final BoxFit fit;
  final double vertical;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: constMarginHerizontal, vertical: vertical),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: boxShape,
            color: Theme.of(context).primaryColorDark,
            borderRadius: boxShape == BoxShape.rectangle
                ? const BorderRadius.all(Radius.circular(8))
                : null),
        width: width,
        height: height,
        child: FittedBox(fit: fit, child: Center(child: child)),
      ),
    );
  }
}
