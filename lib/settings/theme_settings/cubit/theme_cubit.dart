import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeData: avalibeAppTheme[AppTheme.BlueLight]!,
            themeName: appThemeNames[AppTheme.BlueLight]!,
          ),
        );

  changeTheme(AppTheme appTheme) {
    emit(ThemeState(
      themeData: avalibeAppTheme[appTheme]!,
      themeName: appThemeNames[appTheme]!,
    ));
  }

  /// only Storing and retrinving the name of the theme tojson and fromJson
  /// because i cannot connvet the themedata to json String

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    // if no Stored It will return the initial theme
    if (json['value'] == null)
      return ThemeState(
        themeData: avalibeAppTheme[AppTheme.BlueLight]!,
        themeName: appThemeNames[AppTheme.BlueLight]!,
      );

    late AppTheme storedTheme;
    appThemeNames.forEach((key, value) {
      if (value == json['value']) {
        storedTheme = key;
      }
    });
    return ThemeState(
      themeData: avalibeAppTheme[storedTheme]!,
      themeName: appThemeNames[storedTheme]!,
    );
  }

  @override
  Map<String, String>? toJson(ThemeState state) => {'value': state.themeName};
}
