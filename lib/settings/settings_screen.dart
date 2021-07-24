import 'package:flutter/material.dart';
import 'package:my_ecommerce/l10n/l10n.dart';
import 'language_settings/language_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LanguageWidget(
          locale: Localizations.localeOf(context),
          flag: L10n.getFlag(Localizations.localeOf(context).languageCode),
          // provider : Provider.of<LanguageChangeProvider>(context),
        ),
      ),
    );
  }
}
