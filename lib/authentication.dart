import 'package:ecommerce_project/main.dart';
import 'package:flutter/material.dart';

class authentication extends StatefulWidget {
  const authentication({super.key});

  @override
  State<authentication> createState() => _authenticationState();
}

class _authenticationState extends State<authentication> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/homePage/Logo.png', width: MediaQuery.of(context).size.width * 0.1)),

      body: Padding(
        padding: EdgeInsets.all(10),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Text("Login / Sign-up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: blue)),
            ),

            SizedBox(height: 20,),

            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter Your Username",
                prefixIcon: Icon(Icons.person, color: blue,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: blue, width: 1)
                ),
                focusColor: gold,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: gold, width: 1)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: blue, width: 1)
                ),
              ),
            ),

            SizedBox(height: 10,),

            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                prefixIcon: Icon(Icons.password, color: blue,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: blue, width: 1)
                ),
                focusColor: gold,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: gold, width: 1)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: blue, width: 1)
                ),
              ),
            )
          ]
        ),
      )    
    );
  }
}