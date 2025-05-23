import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(const eCommerce());
}

final Color gold = Color(0xFFF3C623);
final Color blue = Color(0xFF10375C);
final Color white = Color(0xFFF4F6FF);
final Color whiteTextColor = Colors.white;
final Color blackTextColor = Colors.black;

class eCommerce extends StatelessWidget {
  const eCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReyNoon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto-VariableFont_wdth,wght',
        primaryColor: gold,
        scaffoldBackgroundColor: white,
        appBarTheme: AppBarTheme(
          backgroundColor: blue,
          foregroundColor: gold
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: gold,
            backgroundColor: blue,
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 14)
          )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: whiteTextColor),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: whiteTextColor, fontFamily: 'Nunito-VariableFont_wght')
        )
      ),
      home: const homePage(),
    );
  }
}