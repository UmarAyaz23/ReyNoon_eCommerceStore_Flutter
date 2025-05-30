import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/homePage.dart';


class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,

      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(fontSize: 20, color: gold, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),

      body: Padding( 
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/homePage/Logo.png", width: MediaQuery.of(context).size.width * 0.3,),

            SizedBox(height: 20,),
            
            TextField(
              style: TextStyle(color: gold),
              controller: usernameController,
              keyboardType: TextInputType.text,
              cursorColor: gold,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.person, color: gold,),
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: gold,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.email, color: gold,),
                labelText: "Email",
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

            TextField(
              style: TextStyle(color: gold),
              controller: passwordCheckController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: gold,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: Icon(Icons.lock, color: gold,),
                labelText: "Re-Enter Password",
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
                      if (passwordCheckController.text != passwordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: Please correctly re-enter your password")));
                      }

                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text
                      ).then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage()));
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error.toString()}")));
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
                    child: Text("Create Account", style: TextStyle(fontSize: 16, color: blue, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),)
                  ),
                )
              ]
            ),
          ]
        ), 
      )
    );
  }
}