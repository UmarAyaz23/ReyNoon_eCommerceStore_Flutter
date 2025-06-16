import 'package:ecommerce_project/imports.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState()=> _accountPageState();
}

class _accountPageState extends State<accountPage> {

  final List<Map<String, dynamic>> generalOptions = [
    {'icon': Icon(Icons.help_center_rounded, size: 25, color: gold,), 'text': Text('Help Center', style: appTextStyles.bodyLarge)},
    {'icon': Icon(Icons.policy_rounded, size: 25, color: gold,), 'text': Text('Terms & Policies', style: appTextStyles.bodyLarge)},
    {'icon': Icon(Icons.payment_rounded, size: 25, color: gold,), 'text': Text('Payment Methods', style: appTextStyles.bodyLarge)},
  ];



/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<fetchUserdetails>(context);
    
    return Scaffold(
      appBar: AppBar(title: 
        Text(
          "Account",
          style: appTextStyles.h3,
        ),

        shape: Border(
          bottom: BorderSide(color: Colors.grey[600]!)
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              ListTile(
                minVerticalPadding: 0,
                minLeadingWidth: 0,
                minTileHeight: 50,
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, right: 0, left: 10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Icon(Icons.person, size: 25, color: gold,),
                ),
                title: Text("Username", style: appTextStyles.h3,),
                subtitle: Text("${userDetails.userName}", style: appTextStyles.bodySmall,),
                trailing: IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage()));}, icon: Icon(Icons.edit_note, size: 35, color: gold)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey[400]!, width: 1)
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
                    {'icon': Icon(RIcon.List, size: 25, color: white,), 'text': 'Orders', 'goTo': userOrderPage(),},
                    {'icon': Icon(Icons.shopping_bag, size: 25, color: white,), 'text': 'Cart', 'goTo': CartPage(),},
                    {'icon': Icon(Icons.map_rounded, size: 25, color: white,), 'text': 'Addresses', 'goTo': null},
                  ].map<Widget>((path) {
                    final Icon icon = path['icon'] as Icon;
                    final String text = path['text'] as String;
                    final Widget? goTo = path['goTo'] as Widget?;

                    return GestureDetector(
                      onTap: () {
                        if (goTo != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => goTo));
                        } else {
                          // You can add some logic here if there's no screen yet
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Coming Soon"))
                          );
                        }
                      },
                      child: Container(
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
                  border: Border.all(color: Colors.grey[400]!, width: 1)
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
                          side: BorderSide(color: Colors.grey[400]!, width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      child: Text("Log Out", style: appTextStyles.withColor(appTextStyles.labelMid, Colors.grey[600]!))
                    )
                  )
                ]
              )
            ],
          ),
        )
      ),
    );
  }
}