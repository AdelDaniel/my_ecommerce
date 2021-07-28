import 'package:flutter/material.dart';
import 'package:my_ecommerce/settings/theme_settings/app_themes.dart';
import 'package:my_ecommerce/settings/theme_settings/cubit/theme_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_themes.dart';

class ChangeThemeWidget extends StatelessWidget {
  final ThemeCubit themeCubit;
  const ChangeThemeWidget({Key? key, required this.themeCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        for (var item in AppTheme.values)
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) =>
                      avalibeAppTheme[item]!.primaryColor),
            ),
            onPressed: () => themeCubit.changeTheme(item),
            child: Text(_getThemeName(context, item)),
          ),
      ],
    );
  }

  String _getThemeName(BuildContext context, AppTheme item) {
    switch (item) {
      case AppTheme.BlueDark:
        return AppLocalizations.of(context).blueDark;
      case AppTheme.BlueLight:
        return AppLocalizations.of(context).blueLight;
      case AppTheme.DarkTheme:
        return AppLocalizations.of(context).darkTheme;
      case AppTheme.GreenDark:
        return AppLocalizations.of(context).greenDark;
      case AppTheme.GreenLight:
        return AppLocalizations.of(context).greenLight;
    }
  }
}
