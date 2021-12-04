import 'package:flutter/widgets.dart';

class QuantityNumberText extends StatelessWidget {
  const QuantityNumberText({Key? key, required this.quantity})
      : super(key: key);
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: quantity.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          children: const <TextSpan>[
            TextSpan(text: '.x', style: TextStyle(fontSize: 11))
          ]),
      textDirection: TextDirection.ltr,
    );
  }
}
