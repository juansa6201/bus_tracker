import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bus_tracking/lineas/linea70.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.409691, -64.190843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    var zoom = MinMaxZoomPreference(11.3, null);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bus Tracker Cordoba'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          minMaxZoomPreference: zoom,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.3,
          ),
        markers: Set.from(allMarkers),
        ),
      ),
    );
  }
}