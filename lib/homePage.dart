import 'package:ecommerce_project/imports.dart';
import 'package:flutter/rendering.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  void navigateToShopPage(BuildContext context, String category) {
    Navigator.pushNamed(context, '/shop', arguments: {'category': category});
  }

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const homePage(),
    const shopPage(),
    const shopPage(),
    profilePage(),
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _screens[index]),);

    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> sliderList = [
    "assets/Categories/menLuxury/menLuxury_01.jpg", 
    "assets/Categories/womenLuxury/womenLuxury_01.jpg",
    "assets/Categories/menDaily/menDaily_01.jpg",
    "assets/Categories/womenDaily/womenDaily_01.jpg",
  ];


/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello ${FirebaseAuth.instance.currentUser!.email}", style: appTextStyles.bodySmall),
                  Text("Good Morning!", style: appTextStyles.h3),
                ]
              )
            ),

            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())),
              child: Icon(Icons.shopping_bag_outlined, size: 30,)
            )
          ]
        ),

        shape: Border(
          bottom: BorderSide(color: Colors.grey[600]!)
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //What's New
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Text("What's New", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
            ),

            VxSwiper.builder(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              height: MediaQuery.of(context).size.width,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(sliderList[index], fit: BoxFit.cover)
                  )
                );
              }
            ),


            //Categories
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Text("Categories", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 0, top: 10, bottom: 0),
              child: Expanded(child: categoryChips(),),
            ),

          
            //Featured
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 40, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured", style: appTextStyles.withColor(appTextStyles.h2, Colors.grey[600]!)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => shopPage())),
                    child: Text("See All", style: appTextStyles.withColor(appTextStyles.buttonMid, Theme.of(context).primaryColor))
                  )
                ],
              )
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 10, bottom: 20),
              child: Expanded(child: productGrid(aspectRatio: 1, childAspectRatio: 0.65,)),
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
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}