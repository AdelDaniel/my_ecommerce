import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'app_themes.dart';
import 'cubit/theme_cubit.dart';

class ChangeThemeWidget extends StatelessWidget {
  final ThemeCubit themeCubit;
  const ChangeThemeWidget({Key? key, required this.themeCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Text("Choose App Theme."),
              Text(
                "Current Theme Is: ${_getThemeName(context, state.themeName)}",
                style: const TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10.0),
              FlutterSwitch(
                width: 100.0,
                height: 55.0,
                toggleSize: 45.0,
                value: state.themeName != appThemeNames[AppTheme.blueLight],
                borderRadius: 30.0,
                padding: 2.0,
                activeToggleColor: const Color(0xFF6E40C9),
                inactiveToggleColor: const Color(0xFF2F363D),
                activeSwitchBorder: Border.all(
                  color: const Color(0xFF3C1E70),
                  width: 6.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: const Color(0xFFD1D5DA),
                  width: 6.0,
                ),
                activeColor: const Color(0xFF271052),
                inactiveColor: Colors.white,
                activeIcon: const Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: const Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (val) {
                  if (val) {
                    // now is blue light and need to convert it to dart
                    themeCubit.changeTheme(AppTheme.darkTheme);
                  } else {
                    // now is dark and need to convert it to light
                    themeCubit.changeTheme(AppTheme.blueLight);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _getThemeName(BuildContext context, String themeName) {
    if (themeName == appThemeNames[AppTheme.blueLight]) {
      return AppLocalizations.of(context).blueLight;
    } else if (themeName == appThemeNames[AppTheme.darkTheme]) {
      return AppLocalizations.of(context).darkTheme;
    } else {
      return "Wrong ";
    }
  }
}
