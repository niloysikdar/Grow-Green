import 'package:flutter/material.dart';
import 'package:hack_project/constants/colors.dart';

Widget socialLoginButton({
  @required String imageUrl,
  @required String text,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    decoration: BoxDecoration(
      color: socialbackground,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          imageUrl,
          height: 30,
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
            color: lightTextcolor,
            fontSize: 15,
          ),
        ),
        Icon(Icons.ac_unit, color: socialbackground),
      ],
    ),
  );
}
