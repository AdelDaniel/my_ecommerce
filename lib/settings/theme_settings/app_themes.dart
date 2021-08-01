import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
  DarkTheme,
}

const TextStyle headLine1TextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.7,
  decorationStyle: TextDecorationStyle.double,
);
const IconThemeData iconTheme = IconThemeData(color: Colors.white);

const TextStyle bodyText1TextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 30,
);

final avalibeAppTheme = <AppTheme, ThemeData>{
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    accentColor: Colors.black,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle.copyWith(color: Colors.green),
    ),
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
    accentColor: Colors.white,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.black,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle.copyWith(color: Colors.blue),
    ),
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
    accentColor: Colors.white,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
  AppTheme.DarkTheme: ThemeData.dark().copyWith(
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
};

const Map<AppTheme, String> appThemeNames = <AppTheme, String>{
  AppTheme.GreenLight: "Green Light",
  AppTheme.GreenDark: "Green Dark",
  AppTheme.BlueLight: "Blue Light",
  AppTheme.BlueDark: "Blue Dark",
  AppTheme.DarkTheme: "Dark Theme",
};
