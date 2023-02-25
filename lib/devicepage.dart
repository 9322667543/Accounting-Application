import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sharpautomation/devicebuttons.dart';

import 'constants.dart';
import 'getdatafromserver.dart';

class DevicePage extends StatefulWidget {
  var roomid;
  DevicePage(this.roomid);
  @override
  State<StatefulWidget> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  List devices = [];
  void initState() {
    getdevices();
    super.initState();
  }

  @override
  getdevices() async {
    Map data = {
      "RoomID": widget.roomid,
    };
    String response = await getdata("GetRoomDetailsbyRoomId", data);
    setState(() {
      devices = jsonDecode(response);
    });
  }

  @override
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
      backgroundColor: Color.fromRGBO(r, g, b, 0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(r, g, b, 0.4),
        centerTitle: true,
        title: Text("$companyname"),
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute (builder:(context)=>DeviceButtons(devices[index]['RoomID'].toString())));
            },
            child: Text(devices[index]['DeviceName'].toString()),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(r1, g1, b1, 0.4)),
          );
        },
        itemCount: devices.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 11, mainAxisSpacing: 11),
      ),
    );
  }
}
