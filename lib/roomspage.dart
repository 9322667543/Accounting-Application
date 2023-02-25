import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sharpautomation/constants.dart';
import 'package:sharpautomation/devicebuttons.dart';
import 'package:sharpautomation/devicepage.dart';

import 'getdatafromserver.dart';

class RoomPage extends StatefulWidget {
  var userid;
  var locationid;
  RoomPage(this.userid, this.locationid);
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List rooms = [];
  void initState() {
    getrooms();
    super.initState();
  }
  @override
  getrooms() async {
    Map data = {
      "UserId": widget.userid,
      "LocationID":widget.locationid
    };
    String response = await getdata("GetRoomsbyUserIDandLocationId", data);
    setState(() {
      rooms = jsonDecode(response);
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
      backgroundColor: Color.fromRGBO(r,g,b,0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(r,g,b,0.4),
        centerTitle: true,
        title: Text("$companyname"),
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          return ElevatedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceButtons(
                          rooms[index]['RoomID'].toString()),
                    ));

              },
              child: Text(
                rooms[index]['RoomName'].toString()
              ),style: ElevatedButton.styleFrom(backgroundColor:Color.fromRGBO(r1,g1,b1,0.4)),
              );
        },
        itemCount: rooms.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11),
      ),
    );
  }
}
