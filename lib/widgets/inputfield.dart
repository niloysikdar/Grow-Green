import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  CustomInput({@required this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xffA3A0A0),
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: inputbackground,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0xffA3A0A0).withOpacity(0.5),
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade700,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
