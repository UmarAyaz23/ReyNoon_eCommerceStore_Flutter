import 'package:ecommerce_project/imports.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final List<String> sliderList = [
    "assets/Categories/menLuxury/menLuxury_01.jpg", 
    "assets/Categories/womenLuxury/womenLuxury_01.jpg",
    "assets/Categories/menDaily/menDaily_01.jpg",
    "assets/Categories/womenDaily/womenDaily_01.jpg",
  ];


/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email ?? "Guest_Email";

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
                  Text("Hello $userEmail", style: appTextStyles.bodySmall),
                  Text("Good Morning!", style: appTextStyles.h3),
                ]
              )
            ),

            GestureDetector(
              onTap: () {},
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
    );
  }
}