import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import "package:latlong/latlong.dart" as latLng;


class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  Position _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Information"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: FlutterMap(
        options: MapOptions(
            minZoom: 10.0,
            center: latLng.LatLng(17.32,78.48),
        ),

          layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height:80.0,
                  point: latLng.LatLng(17.32,78.48),
                  builder: (ctx) => Container(
                    child: Icon(Icons.directions_bus),
                  )
                )
              ]
            )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            title: Text("Driver"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("Conductor"))
        ],
      onTap: (int index) {
          if(index == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route()));
          }
          if(index == 0)
            {
              _getCurrentLocation();
              debugPrint("LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");
            }
      },
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}

class route extends StatelessWidget {

  final List stops = [
    "Gachibowli",
    "Olari",
    "Central Bus Station (CBS)",
    "Kukatpally",
    "Sanathnagar",
    "Charminar Bus Station",
    "MG Bus Station",
    "Saroor Nagar Bus Terminal",
    "Jubilee Bus Station"
  ];

  final List count_list = [
    "1:00 pm",
    "1:15 pm",
    "1:30 pm",
    "2:00 pm",
    "2:15 pm",
    "2:30 pm",
    "3:30 pm",
    "3:45 pm",
    "4:30 pm"
  ];

  final List present_capacity = [
    "1",
    "3",
    "1",
    "1",
    "13",
    "3",
    "11",
    "13",
    "12"
  ];

  final current_stop = "Kukatpally";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route List"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.blueGrey,
      // ignore: missing_return
      body: ListView.builder(
          itemCount: stops.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 6.5,
              color: stops.elementAt(index) == current_stop ? Colors.green : Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    child: Text(present_capacity.elementAt(index)),
                  ),
                ),
                title: Text(stops.elementAt(index)),
                subtitle: Text("ETA: " + count_list.elementAt(index)),
                //onTap: () => debugPrint("Passenger ${user.elementAt(index)} Details page"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => platform_details(platform_name: stops.elementAt(index),)));
                },
              ),
            );
          }),
    );
  }
}

class platform_details extends StatelessWidget {

  final String platform_name;

  const platform_details({Key key, this.platform_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( platform_name + " Details"),
          backgroundColor: Colors.blueGrey.shade800,
        ),
        body: Center(
          child: Text("List Of Scanned People",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          label: Text('Scan'),
          onPressed: null,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

