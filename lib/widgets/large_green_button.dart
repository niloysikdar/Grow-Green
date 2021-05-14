import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';

Widget largeGreenButton({
  @required String text,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      color: lightgreen,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}
