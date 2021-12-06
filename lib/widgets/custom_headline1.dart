import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/constants.dart';

class CustomHeadLine1 extends StatelessWidget {
  final String text;
  const CustomHeadLine1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 5.0, horizontal: constMarginHerizontal),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
