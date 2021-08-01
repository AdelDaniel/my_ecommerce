import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductAvailabilityWidget extends StatelessWidget {
  final bool isAvalible;
  const ProductAvailabilityWidget({Key? key, required this.isAvalible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAvalible
        ? Text(
            AppLocalizations.of(context).inStock,
            style: TextStyle(fontSize: 11, color: Colors.greenAccent[400]),
          )
        : Text(
            '😞\n${AppLocalizations.of(context).notAvalibale}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey),
          );
  }
}
