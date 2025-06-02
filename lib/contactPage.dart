import 'package:ecommerce_project/imports.dart';



class contactPage extends StatefulWidget {
  const contactPage({super.key});

  @override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const homePage(),
    const shopPage(),
    const contactPage(),
    profilePage(),
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _screens[index]),);

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
              child: Row(
                children: <Widget>[
                  Image.asset("assets/Logo.png", width: 40,),
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Stack(
              children: [
                Image.asset('assets/Banner_01.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
                Align(
                  alignment: Alignment.center,
                  child: Text("#CONTACT US", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: gold),),
                )
              ]  
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: gold,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Contact Us", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blue),),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Email: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blue, fontFamily: 'Nunito-VariableFont_wght'),),
                    Text("ReyNoonSupport@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: blue, fontFamily: 'Nunito-VariableFont_wght'),)
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Phone: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blue, fontFamily: 'Nunito-VariableFont_wght'),),
                    Text("+92 318 2696611", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: blue, fontFamily: 'Nunito-VariableFont_wght'),)
                  ],
                ),
              ],
            ),
          )
        ],
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