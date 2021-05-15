import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_project/screens/shop_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )..apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: ShopDashboard(),
    );
  }
}
