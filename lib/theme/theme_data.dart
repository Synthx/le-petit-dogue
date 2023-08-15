import 'package:flutter/material.dart';

import 'theme_color.dart';

final themeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Termina',
  brightness: Brightness.light,
  splashFactory: NoSplash.splashFactory,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  cardColor: kCardColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    background: kBackgroundColor,
  ),
  dividerColor: kPrimaryColor,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: kBackgroundColor,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.black.withOpacity(0.4),
    elevation: 1,
    titleSpacing: 0,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: kSecondaryColor,
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelColor: kSecondaryColor,
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    indicator: UnderlineTabIndicator(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2,
      ),
    ),
    indicatorColor: kPrimaryColor,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kBackgroundColor,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kSecondaryColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
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
