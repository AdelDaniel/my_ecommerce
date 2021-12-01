import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FittedBox(
            child: ElevatedButton(
                clipBehavior: Clip.antiAlias,
                onPressed: () {},
                child: FittedBox(
                    child: Text(AppLocalizations.of(context).addToCart,
                        softWrap: true)))),
        InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.pink),
                  color: Colors.transparent),
              padding: const EdgeInsets.all(3),
              child: const Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
            )),
      ],
    );
  }
}
