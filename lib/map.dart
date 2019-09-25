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
    buses.forEach((value){
      var marker = Marker(markerId: MarkerId(value['interno']),
          draggable: false,
          onTap: (){
            print(value['interno']);
          },
          position: LatLng(value["latitud"], value["longitud"])
      );
    allMarkers.add(marker);
    });
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Tracker Cordoba'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
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