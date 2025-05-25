import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/shopPage.dart';
import 'package:ecommerce_project/contactPage.dart';
import 'package:flutter/material.dart';

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
            //Banners
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.4,

              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/homePage/Banner_01.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => null /*navigateToShopPage(context, 'Men')*/,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: gold,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: gold, width: 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        child: Text("Shop Men's", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght')),
                      ),
                    ),
                  )
                ]
              )
            ),
                  
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.4,

              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/homePage/Banner_02.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => null /*navigateToShopPage(context, 'Men')*/,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: gold,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: gold, width: 1),
                            borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        child: Text("Shop Women's", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght')),
                      ),
                    ),
                  )
                ]
              )
            ),

            //Featured Products
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              color: gold,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text("Featured Products", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: blue, fontFamily: 'Nunito-VariableFont_wght'),)
                    ),

                    SizedBox(height: 20),

                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,

                      children: [
                        'assets/homePage/Coconut.jpg',
                        'assets/homePage/Pumpkin_Pie.jpg',
                        'assets/homePage/Wet_Stone.jpg',
                        'assets/homePage/Tabac_Ecarlate.jpg'
                      ].map((path) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: blue, width: 1),
                            borderRadius: BorderRadius.circular(1)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1),
                            child: Image.asset(path, fit: BoxFit.cover),
                          ),
                        );
                      }).toList()
                    )
            
                  ],
                )
              )   
            )  
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