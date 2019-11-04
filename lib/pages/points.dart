import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(Points());

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  Position position;
  LatLng latLang;
  int pos;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latLang = new LatLng(position.latitude, position.longitude);
    });
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.409691, -64.190843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        getPoint(position.latitude, position.longitude, 2);
      });
    });
  }

  void _onGeoChanged(CameraPosition positions) {
    if(positions.zoom > 15.0){
      pos = 2;
      setState(() {
        getPoint(position.latitude, position.longitude, pos);

      });
    }else{
      pos = 1;
      setState(() {
        getPoint(position.latitude, position.longitude, pos);

      });
    }
  }
  @override
  void initState() {
    setState(() {
      getLocation();
    });
    super.initState();
  }

  Widget Map() {
    var zoom = MinMaxZoomPreference(11.3, null);
    setState(() {
      getPoint(position.latitude, position.longitude, 2);

    });
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: zoom,
      initialCameraPosition: CameraPosition(
        target: latLang,
        zoom: 16,
      ),
      onCameraMove: _onGeoChanged,
      markers: markersPoints,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Puntos de Venta'),
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
