import 'package:ecommerce_project/imports.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState()=> _shopPageState();
}

class _shopPageState extends State<shopPage> {
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

  final List<String> _options = ["Men's Daily", "Women's Daily", "Men's Luxury", "Women's Luxury"];
  final List<String> _selectedOptions = [];

  void _showMultiSelectDialog() async {
    final List<String> tempSelected = List.from(_selectedOptions);

    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ReusableWidgets.specialText(text: "Filter By", color: gold, fontSize: 20),
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: gold, width: 1.5),
            borderRadius: BorderRadius.circular(15)
          ),
          contentPadding: EdgeInsets.all(5),

          content: SingleChildScrollView(
            child: ListBody(
              children: _options.map((option) {
                return CheckboxListTile(
                  value: tempSelected.contains(option),
                  title: ReusableWidgets.bodyText(text: option, color: blue),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        tempSelected.add(option);
                      } else {
                        tempSelected.remove(option);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),

          actions: [
            TextButton(
              child: ReusableWidgets.bodyText(text: "Cancel", color: blue),
              onPressed: () => Navigator.pop(context),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: gold,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: gold, width: 1),
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              onPressed: () {
                setState(() {
                  _selectedOptions.clear();
                  _selectedOptions.addAll(tempSelected);
                });
                Navigator.pop(context);
              },

              child: ReusableWidgets.specialText(text: "Okay", color: white, fontSize: 16),
            )
          ],
        );
      }
    );
  }

  String get _selectedText => _selectedOptions.isEmpty
      ? 'Select Options'
      : _selectedOptions.join(', ');



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
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Banner
              Container(
                height: 100,
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

              //Filter & Sort
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: _showMultiSelectDialog,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: gold, width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(   
                        children: [
                          Expanded(child: ReusableWidgets.bodyText(text: "Filter By", color: gold)),
                          Icon(Icons.arrow_drop_down, size: 25, color: gold,),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 5,),
                  InkWell(
                    onTap: _showMultiSelectDialog,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: gold, width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: ReusableWidgets.bodyText(text: "Sort By", color: gold)),
                          Icon(Icons.arrow_drop_down, size: 25, color: gold,),
                        ],
                      ),
                    ),
                  ),
                ]
              )
            ],
          ),
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