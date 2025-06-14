import 'package:flutter/material.dart';

class appTheme {
  static final deepBlue = ThemeData(
    primaryColor: const Color(0xFFdbab2c),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[600])
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFdbab2c),
      primary: const Color(0xFFdbab2c),
      brightness: Brightness.light,
      surface: Colors.white,
    ),

    cardColor: Colors.grey,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFdbab2c),
      unselectedItemColor: Colors.grey
    )
  );
}