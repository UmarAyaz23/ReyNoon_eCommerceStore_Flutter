import 'package:ecommerce_project/imports.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState()=> _profilePageState();
}

class _profilePageState extends State<profilePage> {

/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
        Text(
          "Profile",
          style: appTextStyles.h3,
        ),

        shape: Border(
          bottom: BorderSide(color: Colors.grey[600]!)
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Align(alignment: Alignment.center, child: Icon(Icons.person, size: MediaQuery.of(context).size.width * 0.3, color: gold),)
              ),

              SizedBox(height: 15,),
              Divider(thickness: 1, color: Colors.grey[600],),
              SizedBox(height: 5,),
              Text("Profile Information", style: appTextStyles.h3,),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("Name", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)))),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: Text("Name", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.black)))),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy_all_outlined, color: gold))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("Userame", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)))),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: Text("Usename", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.black)))),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy_all_outlined, color: gold))),
                ]
              ),


              SizedBox(height: 25,),
              Divider(thickness: 1, color: Colors.grey[600],),
              SizedBox(height: 5,),
              Text("Profile Information", style: appTextStyles.h3,),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("User ID", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)))),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: Text("User ID", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.black)))),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy_all_outlined, color: gold))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("Email", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)))),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: Text("Email", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.black)))),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy_all_outlined, color: gold))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("Phone", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)))),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: Text("Phone Number", style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.black)))),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy_all_outlined, color: gold))),
                ]
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1, color: Colors.grey[600],),
            ],
          ),
        )
      )
    );
  }
}