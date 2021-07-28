import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
  DarkTheme,
}

final avalibeAppTheme = <AppTheme, ThemeData>{
  AppTheme.GreenLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.black),
  AppTheme.GreenDark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green[700],
      accentColor: Colors.white),
  AppTheme.BlueLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.black),
  AppTheme.BlueDark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700],
      accentColor: Colors.white),
  AppTheme.DarkTheme: ThemeData.dark(),
};

const Map<AppTheme, String> appThemeNames = <AppTheme, String>{
  AppTheme.GreenLight: "Green Light",
  AppTheme.GreenDark: "Green Dark",
  AppTheme.BlueLight: "Blue Light",
  AppTheme.BlueDark: "Blue Dark",
  AppTheme.DarkTheme: "Dark Theme",
};
