import 'package:flutter/material.dart';

import 'colors.dart';

MaterialColor primarySwatch = MaterialColor(0xffff0054, color);
MaterialColor backgroundColor = MaterialColor(0xff14141c, color);
MaterialColor cardColor = MaterialColor(0xFF292B30, color);
MaterialColor hoverColor = MaterialColor(0xFFA6D60E, color);
ThemeData mainTheme = ThemeData(
  primaryColor: primarySwatch,
  cardColor: cardColor,
  fontFamily: 'Rajdhani',
  scaffoldBackgroundColor: backgroundColor,
  hoverColor: hoverColor,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(
    background: backgroundColor,
  ),
);
