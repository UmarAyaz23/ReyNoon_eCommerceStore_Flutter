import 'package:ecommerce_project/imports.dart';

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
final Color blue = Color(0xFF121212);
final Color white = Color(0xFFFFFFFF);

class eCommerce extends StatelessWidget {
  const eCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReyNoon',
      debugShowCheckedModeBanner: false,
      theme: appTheme.deepBlue,
      home: signInPage(),
    );
  }
}