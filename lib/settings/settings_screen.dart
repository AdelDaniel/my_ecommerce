import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/settings/theme_settings/cubit/theme_cubit.dart';
import 'package:my_ecommerce/widgets/custom_app_bar.dart';
import '../l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language_settings/change_language_widget.dart';
import 'theme_settings/change_theme_widget.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  static Route route() => MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => SettingsScreen(),
      );

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).settings,
      ),
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
