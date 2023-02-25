import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharpautomation/homepage.dart';
import 'package:sharpautomation/loginpage.dart';
import 'package:http/http.dart';
import 'package:sharpautomation/splashscreen.dart';
import 'package:sharpautomation/utils/routes.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily),
      home: LoginPage(),
    );
  }
}
