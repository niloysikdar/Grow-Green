import 'package:flutter/material.dart';
import 'package:hack_project/widgets/inputfield.dart';

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
          ],
        ),
      ),
    );
  }
}
