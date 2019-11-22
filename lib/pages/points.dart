import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bus_tracker/loader/loader.dart';

void main() => runApp(Points());

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  Position position;
  LatLng latLang;
  var result;

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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getLocation();
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        getPoint(position.latitude, position.longitude);
      });
    });
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
      getPoint(position.latitude, position.longitude);
    });
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: zoom,
      initialCameraPosition: CameraPosition(
        target: latLang,
        zoom: 16,
      ),
      markers: markersPoints,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (latLang == null) {
      return MaterialApp(
        home: Scaffold(backgroundColor: Colors.white, body: new Center(child: ColorLoader3(),),),
      );
    } else {
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
}
