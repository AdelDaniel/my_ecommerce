import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CatalogScreen(),
      );
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).cart),
      bottomNavigationBar: const CustomBottmAppBar(),
    );
  }
}
