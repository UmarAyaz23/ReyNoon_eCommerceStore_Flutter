import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:velocity_x/velocity_x.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableWidgets.headText(text: "Profile", color: gold),
        backgroundColor: blue,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              ReusableWidgets.headText(text: "Username", color: gold),

              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: gold
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: gold
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(RIcon.Notes_Minimalistic, size: 25, color: white,),
                        ReusableWidgets.specialText(text: "Orders", color: white, fontSize: 16)
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: gold
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(RIcon.Map, size: 25, color: white,),
                        ReusableWidgets.specialText(text: "Addresses", color: white, fontSize: 16)
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: gold, width: 1.5),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      child: ReusableWidgets.specialText(text: "Log Out", color: gold, fontSize: 16)
                    )
                  )
                ]
              )
            ],
          ),
        )
      )
    );
  }
}