import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.black,
      iconTheme: IconThemeData(
        color: AppColor.primaryColor,
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColor.white,
      unselectedItemColor: AppColor.black,
      showSelectedLabels: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColor.primaryColor,
      ),
    ),
  );
}
