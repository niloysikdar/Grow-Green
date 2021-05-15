import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/widgets/inputfield.dart';
import 'package:hack_project/widgets/large_green_button.dart';
import 'package:hack_project/widgets/social_login_button.dart';

class SignupScreen extends StatelessWidget {
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
              CustomInput(
                hintText: "Full Name",
              ),
              SizedBox(height: 20),
              CustomInput(
                hintText: "Email",
              ),
              SizedBox(height: 20),
              CustomInput(
                hintText: "Enter Password",
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomInput(
                hintText: "Confirm Password",
                obscureText: true,
              ),
              SizedBox(height: 30),
              largeGreenButton(
                text: "SIGN UP",
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
                      print("Login here pressed");
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
