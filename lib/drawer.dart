import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharpautomation/loginpage.dart';
import 'constants.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(r1, g1, b1, 1.0),
            Color.fromRGBO(r1, g1, b1, 1.0)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    print("Helloo");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: new DecorationImage(
                          image: AssetImage(""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Text(
                '$username',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$usermailid',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'My Account',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.person_pin,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Feedback',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.feedback,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Help',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.help,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Share',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.share,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'About Us',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.people,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Change Screen Type',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Sign Out',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.power_settings_new,
            color: Colors.grey,
          ),
          onTap: () {
            showDialog(
              builder: (context) => AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('You want to logout'),
                actions: <Widget>[
                   TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                   TextButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ),
              context: context,
            );
          },
        ),
      ],
    ));
  }
}
