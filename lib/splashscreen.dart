import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharpautomation/loginpage.dart';
import 'getdatafromserver.dart';
import 'homepage.dart';
import 'constants.dart';
import 'package:string_to_color/string_to_color.dart';

class splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _splashscreenstate();
}

class _splashscreenstate extends State<splashscreen> {
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }

  void getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var user = prefs.getString("user");
    var password = prefs.getString("password");
    Map data = {"MobileNumber": user};
    try {
      String response = await getdata("GetUserbyMobileNumber", data);
      var map_name = jsonDecode(response.toString());
      // maincolor = ColorUtils.stringToHexColor(map_name[0]['Back_Color'].toString().toLowerCase());
      //buttoncolor=ColorUtils.stringToHexColor(map_name[0]['Button_Color'].toString().toLowerCase());
      r = map_name[0]['Back_Red'];
      g = map_name[0]['Back_Green'];
      b = map_name[0]['Back_Blue'];
      r1 = map_name[0]['Button_Red'];
      g1 = map_name[0]['Button_Green'];
      b1 = map_name[0]['Button_Blue'];
      username = map_name[0]['Name'];
      usermailid = map_name[0]['EmailId'];
      companyname = map_name[0]['CompanyName'];
      contactno = map_name[0]['AssistanceContact'];
      userid=map_name[0]['UserId'].toString();
      if (map_name[0]['Password'] == (password)) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(map_name[0]['UserId'].toString()),
            ));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } catch (ex) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
