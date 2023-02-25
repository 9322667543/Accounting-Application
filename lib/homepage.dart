import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sharpautomation/drawer.dart';
import 'package:sharpautomation/getdatafromserver.dart';
import 'package:sharpautomation/roomspage.dart';
import 'package:sharpautomation/utils/routes.dart';
import 'package:sharpautomation/constants.dart' as Constants;
import 'constants.dart';
import 'constants.dart';
import 'loginpage.dart';

class HomePage extends StatefulWidget {
  var userid;

  HomePage(this.userid);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var l;
  List locationsmap = [];



  void initState() {
    getlocation();
    super.initState();
  }

  @override
  getlocation() async {
    Map data = {
      "UserId": widget.userid,
    };
    String response = await getdata("GetlocationsByUserId", data);
    setState(() {
      locationsmap = jsonDecode(response);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        'For Assistance!\n Contact $contactno',
        style: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Colors.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color.fromRGBO(r, g, b, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(r, g, b, 1.0),
        centerTitle: true,
        title: Text(
          "$companyname",
          textAlign: TextAlign.center,
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: TextTheme().apply(bodyColor: Colors.black),
                dividerColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.white)),
            child: PopupMenuButton<int>(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0,  child: Row(
                  children: [
                    Text("Change Password",style: TextStyle(color: Colors.black),),
                    const SizedBox(
                      width: 80,
                    ),

                    Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ],
                )
                ),
                PopupMenuItem<int>(
                    value: 1, child:
                    Row(
                      children:[
                Text("Add New Device",style: TextStyle(color: Colors.black),),
                        SizedBox(
                          width: 92 ,
                        ),
                        Icon(
                          Icons.device_hub,
                          color: Colors.black,
                        )
                   ]
                    )
                    ),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Text("Add New Location",style:TextStyle(color: Colors.black),),
                        const SizedBox(
                          width: 78,
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
                PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        Text("Device QR Scan",style:TextStyle(color: Colors.black),),
                        const SizedBox(
                          width: 97,
                        ),
                        Icon(
                          Icons.center_focus_weak,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
                PopupMenuItem<int>(
                    value: 4,
                    child: Row(
                      children: [
                        Text("Assign New WIFI to device",style:TextStyle(color: Colors.black),),
                        const SizedBox(
                          width: 22,
                        ),
                        Icon(
                          Icons.wifi,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
                PopupMenuItem<int>(
                    value: 5,
                    child: Row(
                      children: [
                        Text("Assign Notification",style:TextStyle(color: Colors.black),),
                        const SizedBox(
                          width: 78,
                        ),
                        Icon(
                          Icons.sync,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ),
        ],
      ),
      drawer:AppDrawer(),
      body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child:
        Text("Locations",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
       Expanded(child:  
      GridView.builder(
        itemBuilder: (context, index) {
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomPage(widget.userid,
                          locationsmap[index]['LocationID'].toString()),
                    ));
              },
              child: Text(
                locationsmap[index]['LocationName'],
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(r1,g1,b1,0.4)));
        },
        itemCount: locationsmap.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11),
      )
      ),
      ],
      )
    );
  }
  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
       print("clicked");
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");
        break;
      case 4:
        print("User Logged out");
        break;
    }
  }
}
