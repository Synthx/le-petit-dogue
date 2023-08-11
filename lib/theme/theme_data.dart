import 'package:flutter/material.dart';

import 'theme_color.dart';

final themeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Termina',
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    background: kBackgroundColor,
  ),
  dividerColor: kDividerColor,
  iconTheme: const IconThemeData(
    color: kBodyTextColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: kTextColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: kTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: kBodyTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      color: kBodyTextColor,
    ),
  ),
);
