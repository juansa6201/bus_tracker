import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Set<Marker> markers = Set();
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.364922, -64.206986);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    markers.addAll([
      Marker(
          markerId: MarkerId('value'),
          position: LatLng(-31.364922, -64.206986)),
      Marker(
          markerId: MarkerId('value2'),
          position: LatLng(-31.364613, -64.206787)),
    ]);
  }

  List data;

  Future<String> getData() async {
    var res = await http.get(
        Uri.encodeFull("https://200.123.180.122:5743/rest/posicionesBuses/20"),
        headers: {
          "Accept": "application/json"
        }
    );
    setState(() {
      var resBody = jsonDecode(res.body);
      data = resBody["posiciones"];
      print(data);
    });

    return "Success!";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps in Flutter'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: markers,
          ),
          Container(
            margin: EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                    child: Icon(Icons.layers),
                    elevation: 5,
                    backgroundColor: Colors.teal[200],
                    onPressed: () {
                      getData();
                      print('Changing the Map Type');
                    }),
              ],
            ),
          ),

        ],
      ),
    );
  }

}