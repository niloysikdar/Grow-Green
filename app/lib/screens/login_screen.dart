import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/screens/signup.dart';
import 'package:hack_project/widgets/inputfield.dart';
import 'package:hack_project/widgets/large_green_button.dart';
import 'package:hack_project/widgets/social_login_button.dart';
import 'package:hack_project/authentication.dart';
import 'package:hack_project/screens/map.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email="";

  String _password="";

  final AuthenticationHelper  _auth = AuthenticationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30,
          ),
          child: Column(
            children: [
              Text(
                "Log In",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: inputbackground,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),

                onChanged: (value){
                  setState(() {
                    _email = value;
                  });

                },

              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  fillColor: inputbackground,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),

                onChanged: (value){
                  setState(() {
                    _password = value;

                  });

                },

              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  print("Forgot password pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      color: lightgreen,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextButton(

                  onPressed: () async {
                    print("$_email, $_password");
                    dynamic result = await _auth.signIn(_email, _password);
                    if(result == null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Map()));
                    }else {
                      final snackBar = SnackBar(
                        content: Text("$result"),
                        action: SnackBarAction(
                          label: 'Ok',

                        ),
                      );
                    }
                  },
                  child: Text(
                      "Log In",
                  style: TextStyle(
                    color: Colors.white,

                  )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(lightgreen),
                  ),
              ),
              SizedBox(height: 50),
              socialLoginButton(
                imageUrl: "assets/images/google.png",
                text: "Sign in with Google",
              ),
              SizedBox(height: 20),
              socialLoginButton(
                imageUrl: "assets/images/facebook.png",
                text: "Sign in with Facebook",
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Not a member?",
                      style: TextStyle(
                        color: lightTextcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Join now pressed");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Join Now",
                        style: TextStyle(
                          color: lightgreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
