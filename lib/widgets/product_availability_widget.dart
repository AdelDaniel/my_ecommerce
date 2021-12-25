import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductAvailabilityWidget extends StatelessWidget {
  final bool isAvalible;
  const ProductAvailabilityWidget(
      {Key? key, required this.isAvalible, this.alignment = Alignment.topRight})
      : super(key: key);
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: isAvalible
          ? Text(
              AppLocalizations.of(context).inStock,
              style: TextStyle(fontSize: 11, color: Colors.greenAccent[400]),
            )
          : Text(
              '😞\n${AppLocalizations.of(context).notAvalibale}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
    );
  }
}
