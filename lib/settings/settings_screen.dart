import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/settings/theme_settings/cubit/theme_cubit.dart';
import '../l10n/l10n.dart';
import 'language_settings/change_language_widget.dart';
import 'theme_settings/change_theme_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ChangeLanguageWidget(
            locale: Localizations.localeOf(context),
            flag: L10n.getFlag(Localizations.localeOf(context).languageCode),
          ),
          ChangeThemeWidget(
            themeCubit: BlocProvider.of<ThemeCubit>(context),
          )
        ]),
      ),
    );
  }
}
