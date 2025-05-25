import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/homePage.dart';
import 'package:ecommerce_project/signUpPage.dart';

class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Padding( 
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/homePage/Logo.png", width: MediaQuery.of(context).size.width * 0.5,),

            SizedBox(height: 20,),
            
            TextField(
              style: TextStyle(color: gold),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: gold,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.email, color: gold,),
                labelText: "Username",
                labelStyle: TextStyle(fontSize: 16, color: gold, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Color.fromRGBO(219, 171, 44, 0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(style: BorderStyle.none, width: 0)
                ),
              ),
            ),

            SizedBox(height: 15,),

            TextField(
              style: TextStyle(color: gold),
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: gold,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.lock, color: gold,),
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 16, color: gold, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Color.fromRGBO(219, 171, 44, 0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(style: BorderStyle.none, width: 0)
                ),
              ),
            ),

            SizedBox(height: 15,),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text
                      ).then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage()));
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: Incorrect email or password")));
                      });
                    }, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      backgroundColor: gold,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(style: BorderStyle.none, width: 0),
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    child: Text("Sign In", style: TextStyle(fontSize: 16, color: blue, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),)
                  ),
                )
              ]
            ),

            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: white, fontFamily: 'Nunito-VariableFont_wght'),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage())),
                  child: Text("Sign Up", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: white, fontFamily: 'Nunito-VariableFont_wght'),)
                )
              ]
            )
          ]
        ), 
      )
    );
  }
}