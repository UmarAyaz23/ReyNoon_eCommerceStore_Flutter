import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/reusableWidgets.dart';
import 'package:ecommerce_project/shopPage.dart';
import 'package:ecommerce_project/contactPage.dart';
import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  void navigateToShopPage(BuildContext context, String category) {
    Navigator.pushNamed(context, '/shop', arguments: {'category': category});
  }

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Row(
                children: <Widget>[
                  Image.asset("assets/homePage/Logo.png", height: 40,),
                  SizedBox(width: 10,),
                  Text("REYNOON", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: gold))
                ]
              )
            ),

            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Icon(Icons.shopping_bag, size: 30,)
            )
          ]
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //What's New
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsetsDirectional.only(top: 0, bottom: 0, start: 5, end: 5),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: gold, width: 2)),
              ),
              child: Align(alignment: Alignment.bottomCenter, child: ReusableWidgets.headText(text: "What's New", color: gold),)
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsetsDirectional.only(top: 7, bottom: 0, start: 5, end: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: gold
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: PageView(
                      children: [
                        Image.asset("assets/homePage/Banner_01.jpg", fit: BoxFit.cover),
                        Image.asset("assets/homePage/Banner_02.jpg", fit: BoxFit.cover),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: Align(alignment: Alignment.centerLeft, child: Icon(Icons.arrow_back_ios, size: 25, color: gold,),)
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: Align(alignment: Alignment.centerRight, child: Icon(Icons.arrow_forward_ios, size: 25, color: gold,),)
                  )
                ]
              )
            ),


            //Our Offerings
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsetsDirectional.only(top: 10, bottom: 0, start: 5, end: 5),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: gold, width: 2)),
              ),
              child: Align(alignment: Alignment.bottomCenter, child: ReusableWidgets.headText(text: "Our Offerings", color: gold),)
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 7, bottom: 0, start: 5, end: 5),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: [
                  {'icon': Icon(RIcon.Delivery, size: 25, color: white,), 'text': 'Free Delivery'},
                  {'icon': Icon(RIcon.User_Plus_Rounded, size: 25, color: white,), 'text': '24/7 Support'},
                  {'icon': Icon(Icons.find_replace, size: 25, color: white,), 'text': '7 Days Replacement'},
                  {'icon': Icon(RIcon.Medal_Star_Circle, size: 25, color: white,), 'text': '1 Year Warranty'},
                ].map<Widget>((path) {
                  final Icon icon = path['icon'] as Icon;
                  final String text = path['text'] as String;

                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: gold
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        SizedBox(height: 10,),
                        ReusableWidgets.specialText(text: text, color: white, fontSize: 11)
                      ],
                    )
                  );
                }).toList()
              )
            ),


            //Categories
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsetsDirectional.only(top: 10, bottom: 0, start: 5, end: 5),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: gold, width: 2)),
              ),
              child: Align(alignment: Alignment.bottomCenter, child: ReusableWidgets.headText(text: "Categories", color: gold),)
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 7, bottom: 0, start: 5, end: 5),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: [
                  "assets/homePage/Categories/Daily_Wear.jpg",
                  "assets/homePage/Categories/Daily_Wear.jpg", 
                  "assets/homePage/Categories/Daily_Wear.jpg", 
                  "assets/homePage/Categories/Daily_Wear.jpg", 
                ].map<Widget>((path) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          child: Image.asset(path, fit: BoxFit.cover,),
                        ),
                      ]
                    )
                  );
                }).toList()
              )
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 7, bottom: 0, start: 5, end: 5),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: [
                  {'name': 'Daily Wear', 'color': Color(0xFFc78998)},
                  {'name': 'Daily Wear', 'color': Color(0xFFc78998)},
                  {'name': 'Daily Wear', 'color': Color(0xFFc78998)},
                  {'name': 'Daily Wear', 'color': Color(0xFFc78998)}, 
                ].map<Widget>((names) {
                  final String name = names['name'] as String;
                  final Color color = names['color'] as Color;

                  return Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: color
                    ),
                    child: Align(alignment: Alignment.center, child: ReusableWidgets.specialText(text: name, color: white, fontSize: 11))
                  );
                }).toList()
              )
            ),
          ]
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
        backgroundColor: blue,
        selectedItemColor: gold,
        unselectedItemColor: gold,
      ),
    );
  }
}