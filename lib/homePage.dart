import 'package:ecommerce_project/main.dart';
import 'package:ecommerce_project/shopPage.dart';
import 'package:ecommerce_project/aboutPage.dart';
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
      appBar: AppBar(title: Text("REYNOON", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: gold)), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            //Banner
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.4,

                    child: Stack(
                      children: [
                        Image.asset('assets/homePage/Banner_01.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => null /*navigateToShopPage(context, 'Men')*/,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: gold,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: gold, width: 1)
                                ),
                              ),
                              child: Text("Shop Men's", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght')),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 5,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.4,

                    child: Stack(
                      children: [
                        Image.asset('assets/homePage/Banner_02.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => null /*navigateToShopPage(context, 'Women')*/,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: gold,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: gold, width: 1)
                                ),
                              ),
                              child: Text("Shop Women's", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght')),
                            ),
                          ),
                        )
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Featured Products
            SizedBox(height: 5,),

            Container(
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

      endDrawer: Drawer(
        width: 200,
        backgroundColor: blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: gold, width: 1),), 
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.arrow_back_rounded, color: gold,),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => shopPage())),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: gold, width: 1),),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Shop", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght',),),
                  leading: Icon(Icons.shopping_bag, color: gold),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => aboutPage())),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: gold, width: 1),),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("About", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght',),),
                  leading: Icon(Icons.info, color: gold),
                ),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => contactPage())),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: gold, width: 1),),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Contact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: gold, fontFamily: 'Nunito-VariableFont_wght',),),
                  leading: Icon(Icons.contact_page, color: gold),
                ),
              ),
            ),
          ]

        )
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
        backgroundColor: blue,
        selectedItemColor: gold,
        unselectedItemColor: gold,
      ),
    );
  }
}