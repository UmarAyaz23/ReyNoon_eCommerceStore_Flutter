import 'package:ecommerce_project/authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async { 

  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAfN_SBcvkXPpI75_kxwp2wSkIim31lUUg",
        authDomain: "reynoon-ecommerce.firebaseapp.com",
        projectId: "reynoon-ecommerce",
        storageBucket: "reynoon-ecommerce.firebasestorage.app",
        messagingSenderId: "309552766360",
        appId: "1:309552766360:web:29bc4bdeb783fb3df35fed"
      )
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const eCommerce());
}

final Color gold = Color(0xFFdbab2c);
final Color blue = Color(0xFF010b13);
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
      home: const authentication(),
    );
  }
}