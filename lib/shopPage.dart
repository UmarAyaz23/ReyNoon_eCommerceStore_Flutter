import 'package:ecommerce_project/imports.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const homePage(),
    const shopPage(),
    const shopPage(),
    profilePage(),
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );

    setState(() {
      _selectedIndex = index;
    });
  }

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
                  Text("Hello ${FirebaseAuth.instance.currentUser}", style: appTextStyles.bodySmall),
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
            customSearchBar(),

            //Products
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10, top: 0, bottom: 5),
              child: Expanded(child: productGrid(aspectRatio: 4/3, childAspectRatio: 0.78,)),
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
