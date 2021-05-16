import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/screens/login_screen.dart';
import 'package:hack_project/widgets/large_green_button.dart';
import 'package:hack_project/widgets/social_login_button.dart';
import 'package:hack_project/authentication.dart';
import 'package:hack_project/screens/map.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email = "";
  String _password = "";

  final AuthenticationHelper _auth = AuthenticationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30,
          ),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Full Name",
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
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              // CustomInput(
              //   hintText: "Email",
              // ),
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
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              // CustomInput(
              //   hintText: "Enter Password",
              //   obscureText: true,
              // ),
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
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Confirm Password",
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
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  print("Email : $_email and pass $_password");
                  dynamic result = await _auth.signUp(_email, _password);
                  if (result == null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Map(),
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                      content: Text("$result"),
                      action: SnackBarAction(
                        label: 'Ok',
                      ),
                    );
                  }
                },
                child: largeGreenButton(text: "Create an account"),
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
                      "Already a member?",
                      style: TextStyle(
                        color: lightTextcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Login here",
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
