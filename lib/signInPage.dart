import 'package:ecommerce_project/imports.dart';

class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: blue,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                child: Align(alignment: Alignment.topCenter, child: Image.asset("assets/homePage/Logo.png", width: MediaQuery.of(context).size.width * 0.30,),)
              ),
              
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25, bottom: 0, left: 20, right: 20),
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.7),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                        style: TextStyle(color: gold),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: gold,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          prefixIcon: Icon(Icons.email, color: gold,),
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 16, color: gold, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Color.fromRGBO(219, 171, 44, 0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(style: BorderStyle.none, width: 0)
                          ),
                        ),
                      ),

                    SizedBox(height: 15,),
                    TextField(
                      style: TextStyle(color: gold),
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: gold,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        prefixIcon: Icon(Icons.lock, color: gold,),
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 16, color: gold, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Color.fromRGBO(219, 171, 44, 0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(style: BorderStyle.none, width: 0)
                        ),
                      ),
                    ),

                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text
                              ).then((value) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage()));
                              }).onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: Incorrect email or password")));
                              });
                            }, 
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              backgroundColor: gold,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(style: BorderStyle.none, width: 0),
                                borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                            child: Text("Sign In", style: TextStyle(fontSize: 16, color: white, fontWeight: FontWeight.w300, fontFamily: 'Nunito-VariableFont_wght'),)
                          ),
                        )
                      ]
                    ),

                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: blue, fontFamily: 'Nunito-VariableFont_wght'),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage())),
                          child: Text("Sign Up", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: blue, fontFamily: 'Nunito-VariableFont_wght'),)
                        )
                      ]
                    ),
                  ],
                ),
              ),
              
            ]
          )
        ]
      )
    );
  }
}