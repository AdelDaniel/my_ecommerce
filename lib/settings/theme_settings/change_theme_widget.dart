import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'app_themes.dart';
import 'cubit/theme_cubit.dart';

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
      case AppTheme.blueDark:
        return AppLocalizations.of(context).blueDark;
      case AppTheme.blueLight:
        return AppLocalizations.of(context).blueLight;
      case AppTheme.darkTheme:
        return AppLocalizations.of(context).darkTheme;
      case AppTheme.greenDark:
        return AppLocalizations.of(context).greenDark;
      case AppTheme.greenLight:
        return AppLocalizations.of(context).greenLight;
    }
  }
}
