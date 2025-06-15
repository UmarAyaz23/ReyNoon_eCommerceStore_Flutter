import 'package:ecommerce_project/imports.dart';

class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/Logo.png", height: MediaQuery.of(context).size.width * 0.4),
              ),
              SizedBox(height: 40,),

              customTextField(
                label: "Email", prefixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress, isPassword: false, controller: _emailController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },  
              ),
              const SizedBox(height: 16,),

              customTextField(
                label: "Password", prefixIcon: Icons.lock_outline, keyboardType: TextInputType.visiblePassword, isPassword: true, controller: _passwordController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },  
              ),
              const SizedBox(height: 16,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text
                    ).then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavigation()));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error.toString()}")));
                    });
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),

                  child: Text("Sign In", 
                    style: appTextStyles.withColor(
                      appTextStyles.buttonMid, Colors.white
                    )
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: appTextStyles.withColor(appTextStyles.bodyMid, Colors.grey[600]!)
                  ),
                  TextButton(
                    onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage())),
                    style: TextButton.styleFrom(
                      backgroundColor: null
                    ),
                    child: Text('Sign Up')
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}