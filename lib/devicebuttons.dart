import 'dart:convert';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'getdatafromserver.dart';

class DeviceButtons extends StatefulWidget {

  var roomid;

  DeviceButtons(this.roomid);
  @override
  State<StatefulWidget> createState() => _DeviceButtonsState();
}

class _DeviceButtonsState extends State<DeviceButtons> {
  int demoindex=0;
  List devicebuttons = [];
  List devices = [];
  var uniquenumber;
  var alluniquenumbers;
  void initState() {
    getdevicebuttons();

    super.initState();
  }

  @override
   getdevicebuttons() async {
    Map data = {
      "UserId": userid,
      "RoomID":widget.roomid
    };
    String response = await getdata("GetOutputDetailsbyUserIdAndRoomID", data);
    setState(() {
      devicebuttons=jsonDecode(response);
    });
  }

  getdevices() async {
    Map data = {
      "RoomID": widget.roomid,
    };
    String response = await getdata("GetRoomDetailsbyRoomId", data);
    setState(() {
      devices = jsonDecode(response);

      for (int i = 0; i < devices.length; i++) {
        alluniquenumbers = new List<String>.generate(
            devices.length, (i) => devices[i]['UniqueNumber'].toString());
      }
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
      backgroundColor: Color.fromRGBO(r,g,b,0.5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(r,g,b,0.4),
        centerTitle: true,
        title: Text("$companyname"),
      ),
        body:

        ListView(
          scrollDirection: Axis.vertical,
          children: [
            for(int x = 0; x<devicebuttons.length;x++)...[
              x==0?
                  Row(
                    children: [
                      ElevatedButton(onPressed:() {

                      }, child:Text(devicebuttons[x]['OutputName']))
                    ],
                  ):
                  devicebuttons[x]['UniqueNumber'].toString()!=devicebuttons[x-1]['UniqueNumber'].toString()?


                          ElevatedButton(onPressed:() {

                          }, child:Text(devicebuttons[x]['OutputName']))


                      :
                  ElevatedButton(onPressed:() {
                  }, child:Text(devicebuttons[x]['OutputName']))

            ],
          ],
        )

    );
  }
}
