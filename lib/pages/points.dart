import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bus_tracker/fetch/fetch.dart';

void main() => runApp(Points());

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  GoogleMapController mapController;


  final LatLng _center = const LatLng(-31.409691, -64.190843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

  }

  Widget Map() {
    var zoom = MinMaxZoomPreference(11.3, null);

    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: zoom,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.3,
      ),
      markers: markersPoints,
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 30), () {
      setState(() {
        getPoint();
      });
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Lineas'),
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )),
        body: Container(
          child: Map(),
        ),
      ),
    );
  }
}
