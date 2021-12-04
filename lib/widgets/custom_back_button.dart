import 'package:flutter/material.dart';

import 'circular_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularIconButton(
      alignment: Alignment.topLeft,
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () => Navigator.pop(context),
    );
  }
}
