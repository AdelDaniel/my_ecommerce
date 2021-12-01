import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AppTheme {
  greenLight,
  greenDark,
  blueLight,
  blueDark,
  darkTheme,
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
  AppTheme.greenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle.copyWith(color: Colors.green),
    ),
  ),
  AppTheme.greenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
    iconTheme: iconTheme,
    textTheme: const TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
  AppTheme.blueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    iconTheme: iconTheme,
    textTheme: TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle.copyWith(color: Colors.blue),
    ),
  ),
  AppTheme.blueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
    iconTheme: iconTheme,
    textTheme: const TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
  AppTheme.darkTheme: ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      headline1: headLine1TextStyle,
      bodyText1: bodyText1TextStyle,
    ),
  ),
};

const Map<AppTheme, String> appThemeNames = <AppTheme, String>{
  AppTheme.greenLight: "Green Light",
  AppTheme.greenDark: "Green Dark",
  AppTheme.blueLight: "Blue Light",
  AppTheme.blueDark: "Blue Dark",
  AppTheme.darkTheme: "Dark Theme",
};
