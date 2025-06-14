import 'package:ecommerce_project/imports.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState()=> _accountPageState();
}

class _accountPageState extends State<accountPage> {

/*--------------------------------------------------------------------------------FRONT END--------------------------------------------------------------------------------*/
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableWidgets.headText(text: "Account", color: gold),
        backgroundColor: blue,
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
                child: Align(alignment: Alignment.center, child: Icon(Icons.person, size: MediaQuery.of(context).size.width * 0.3, color: blue,),)
              ),

              SizedBox(height: 15,),
              Divider(thickness: 1, color: Colors.grey,),
              SizedBox(height: 5,),
              ReusableWidgets.specialText(text: "Profile Information", color: blue, fontSize: 18),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Name", color: Colors.grey, fontSize: 16)),),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Name", color: blue, fontSize: 16)),),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.edit, size: 16, color: Colors.grey))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Username", color: Colors.grey, fontSize: 16)),),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Username", color: blue, fontSize: 16)),),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.edit, size: 16, color: Colors.grey))),
                ]
              ),


              SizedBox(height: 25,),
              Divider(thickness: 1, color: Colors.grey,),
              SizedBox(height: 5,),
              ReusableWidgets.specialText(text: "Personal Information", color: blue, fontSize: 18),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "User ID", color: Colors.grey, fontSize: 16)),),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "User ID", color: blue, fontSize: 16)),),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy, size: 16, color: Colors.grey))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Email", color: Colors.grey, fontSize: 16)),),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Username@email.com", color: blue, fontSize: 16)),),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy, size: 16, color: Colors.grey))),
                ]
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "Phone", color: Colors.grey, fontSize: 16)),),
                  Expanded(flex: 5, child: Align(alignment: Alignment.centerLeft, child: ReusableWidgets.specialText(text: "0318 2696611", color: blue, fontSize: 16)),),
                  Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.copy, size: 16, color: Colors.grey))),
                ]
              ),
              SizedBox(height: 10,),

              Divider(color: Colors.grey,)
            ],
          ),
        )
      )
    );
  }
}