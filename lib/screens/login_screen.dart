import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/widgets/inputfield.dart';
import 'package:hack_project/widgets/large_green_button.dart';
import 'package:hack_project/widgets/social_login_button.dart';

class LoginScreen extends StatelessWidget {
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
              CustomInput(
                hintText: "Email",
              ),
              SizedBox(height: 20),
              CustomInput(
                hintText: "Password",
                obscureText: true,
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
              largeGreenButton(
                text: "LOG IN",
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
