import 'package:ecommerce_project/imports.dart';


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
              child: Row(
                children: <Widget>[
                  Image.asset("assets/Logo.png", height: 40,),
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

            VxSwiper.builder(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              height: MediaQuery.of(context).size.width,
              enlargeCenterPage: true,
              itemCount: sliderList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 7, bottom: 0, left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(sliderList[index], fit: BoxFit.cover)
                  )
                );
              }
            ),


            //Our Offerings
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsetsDirectional.only(top: 20, bottom: 0, start: 5, end: 5),
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
              margin: EdgeInsetsDirectional.only(top: 20, bottom: 0, start: 5, end: 5),
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
                  "assets/Categories/menLuxury/menluxury_Banner.jpg",
                  "assets/Categories/womenLuxury/womenluxury_Banner.jpg",
                  "assets/Categories/menDaily/menDaily_Banner.jpg",
                  "assets/Categories/womenDaily/womenDaily_Banner.jpg",  
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
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(path, fit: BoxFit.cover,),
                        ),
                      ]
                    )
                  );
                }).toList()
              )
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(top: 5, bottom: 0, start: 5, end: 5),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 3,
                children: [
                  {'name': 'Luxury - Men', 'color': gold},
                  {'name': 'Luxury - Women', 'color': gold},
                  {'name': 'Daily - Men', 'color': gold},
                  {'name': 'Daily - Women', 'color': gold}, 
                ].map<Widget>((names) {
                  final String name = names['name'] as String;
                  final Color color = names['color'] as Color;

                  return SizedBox(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: color, width: 1.5)
                      ),
                      child: Align(alignment: Alignment.center, child: ReusableWidgets.specialText(text: name, color: gold, fontSize: 11))
                    )
                  );
                }).toList()
              )
            ),
          
          
            //Featured
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsetsDirectional.only(top: 20, bottom: 0, start: 5, end: 5),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: gold, width: 2)),
              ),
              child: Align(alignment: Alignment.bottomCenter, child: ReusableWidgets.headText(text: "Featured", color: gold),)
            ),

            Container(
              margin: EdgeInsets.only(top: 7, bottom: 10, left: 0, right: 0),
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              color: blue,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(5),
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/Categories/menLuxury/menLuxury_05.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.width * 0.3,),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                ReusableWidgets.specialText(text: "Men's Luxury 05", color: blue, fontSize: 12),
                                ReusableWidgets.specialText(text: "Rs. 2500/-", color: Colors.green, fontSize: 12),
                              ]
                            )
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(5),
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/Categories/womenDaily/womenDaily_05.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.width * 0.3,),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                ReusableWidgets.specialText(text: "Women's Daily 05", color: blue, fontSize: 12),
                                ReusableWidgets.specialText(text: "Rs. 2500/-", color: Colors.green, fontSize: 12),
                              ]
                            )
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(5),
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/Categories/menDaily/menDaily_09.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.width * 0.3,),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                ReusableWidgets.specialText(text: "Men's Daily 09", color: blue, fontSize: 12),
                                ReusableWidgets.specialText(text: "Rs. 2500/-", color: Colors.green, fontSize: 12),
                              ]
                            )
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(5),
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/Categories/womenLuxury/womenLuxury_05.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.width * 0.3,),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                ReusableWidgets.specialText(text: "Women's Luxury 05", color: blue, fontSize: 12),
                                ReusableWidgets.specialText(text: "Rs. 2500/-", color: Colors.green, fontSize: 12),
                              ]
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}