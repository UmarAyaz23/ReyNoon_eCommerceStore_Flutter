import 'package:ecommerce_project/imports.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState()=> _profilePageState();
}

class _profilePageState extends State<profilePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const homePage(),
    const shopPage(),
    const shopPage(),
    const profilePage(),
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _screens[index]),);

    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> generalOptions = [
    {'icon': Icon(Icons.help_center_rounded, size: 25, color: gold,), 'text': Text('Help Center', style: TextStyle(color: gold, fontSize: 16, fontWeight: FontWeight.normal))},
    {'icon': Icon(Icons.policy_rounded, size: 25, color: gold,), 'text': Text('Terms & Policies', style: TextStyle(color: gold, fontSize: 16, fontWeight: FontWeight.normal))},
    {'icon': Icon(Icons.payment_rounded, size: 25, color: gold,), 'text': Text('Payment Methods', style: TextStyle(color: gold, fontSize: 16, fontWeight: FontWeight.normal))},
  ];



/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
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
              ReusableWidgets.headText(text: FirebaseAuth.instance.currentUser?.displayName ?? FirebaseAuth.instance.currentUser?.email ?? "User", color: gold),

              //Banner
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: gold
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/Banner_01.jpg", fit: BoxFit.cover,),
                ),
              ),
              
              //Tiles
              Padding(
                padding: EdgeInsetsDirectional.only(top: 10, bottom: 0, start: 0, end: 0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  children: [
                    {'icon': Icon(RIcon.List, size: 25, color: white,), 'text': 'Orders'},
                    {'icon': Icon(RIcon.Heart_, size: 25, color: white,), 'text': 'Favourites'},
                    {'icon': Icon(Icons.map_rounded, size: 25, color: white,), 'text': 'Addresses'},
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          icon,
                          ReusableWidgets.specialText(text: text, color: white, fontSize: 16)
                        ],
                      )
                    );
                  }).toList()
                )
              ),

              //General Options
              Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15) ,
                  border: Border.all(color: gold, width: 1.5)
                ),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: generalOptions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      leading: generalOptions[index]["icon"],
                      title: generalOptions[index]["text"],
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 25, color: gold,),
                      tileColor: white,
                    );
                  }
                ),
              ),

              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signInPage()));
                      },
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