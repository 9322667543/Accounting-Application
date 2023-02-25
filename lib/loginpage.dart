import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharpautomation/getdatafromserver.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:string_to_color/string_to_color.dart';
import 'constants.dart' as Constants;
import 'constants.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final url = Constants.baseurl + "GetUserbyMobileNumber";
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text("Login"),
                  onPressed: () async {
                    try {
                      Map data = {"MobileNumber": nameController.text};
                      String response =
                          await getdata("GetUserbyMobileNumber", data);
                      var map_name = jsonDecode(response.toString());
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          "user", map_name[0]['MobileNumber'].toString());
                      prefs.setString(
                          "password", map_name[0]['Password'].toString());
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
                      if (map_name[0]['Password'] ==
                          (passwordController.text)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(map_name[0]['UserId'].toString()),
                            ));
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          desc: "Wrong Password",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Try Again",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    } catch (err) {
                      print(err.toString());
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
