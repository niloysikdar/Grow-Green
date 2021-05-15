import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';
import 'package:hack_project/widgets/inputfield.dart';
import 'package:hack_project/widgets/large_green_button.dart';
import 'package:hack_project/screens/map.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            ),
            SizedBox(height: 20),
            Text(
              "Forgot Password ?",
              style: TextStyle(
                color: lightgreen,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 40),
            largeGreenButton(
              text: "LOG IN",
            ),
            SizedBox(height: 40),
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
            })
          ],
        ),
      ),
    );
  }
}
