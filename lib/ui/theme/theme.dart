import 'package:flutter/material.dart';

import 'colors.dart';

const MaterialColor primarySwatch = MaterialColor(0xffff0054, color);
const MaterialColor backgroundColor = MaterialColor(0xff14141c, color);
const MaterialColor cardColor = MaterialColor(0xFF292B30, color);
const MaterialColor hoverColor = MaterialColor(0xFFA6D60E, color);
final ThemeData mainTheme = ThemeData(
  primaryColor: primarySwatch,
  cardColor: cardColor,
  fontFamily: 'Rajdhani',
  scaffoldBackgroundColor: backgroundColor,
  hoverColor: hoverColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: primarySwatch,
  ).copyWith(surface: backgroundColor),
);
