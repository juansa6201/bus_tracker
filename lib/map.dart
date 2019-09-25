import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.364922, -64.206986);

  List buses;
  List<Marker> allMarkers = [];

  void getData() async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    Response response=await dio.get("https://200.123.180.122:5743/rest/posicionesBuses/70/");  //CERTIFICATE_VERIFY_FAILED:ok
    buses = response.data['posiciones'];

  }


  @override
  Widget build(BuildContext context) {
    getData();
    print("dou");
    print(buses[0]["latitud"]);
    print(buses[1]["latitud"]);
    allMarkers.addAll([Marker(markerId: MarkerId('1'),
        draggable: false,
        onTap: (){
          getData();
          print(buses[2]["interno"]);
        },
        position: LatLng(buses[0]["latitud"], buses[0]["longitud"])
    ),
      Marker(markerId: MarkerId('2'),
          draggable: false,
          onTap: (){
            getData();
            print(buses[0]["interno"]);
          },
          position: LatLng(buses[1]["latitud"], buses[1]["longitud"])),
]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps in Flutter'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
getData();
            },

            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
              
            markers: Set.from(allMarkers)
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
                      print(buses);
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