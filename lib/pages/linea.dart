import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:bus_tracker/fetch/fetch_ruta.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.409691, -64.190843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  List _fruits = ["-","10","11","12","13","14","15","16","17","18","19","20", "21", "22", "23", "24","25","26","27","28","29", "30","31","32","33","34","35","36","40","41","42",
    "43","44","45","50","51","52","53","54","60","61","62","63","64","65","66","67","68","70","71","72","73","74","75","80","81","82","83","84","85"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    Timer(Duration(seconds: 1), () {
      setState(() {
        getData(_selectedFruit);
        getRuta(_selectedFruit);
      });     });
    Timer.periodic(Duration(milliseconds: 5000), (timer){
      setState(() {
        getData(_selectedFruit);
      });    });
    setState(() {
      _selectedFruit = selectedFruit;
      getData(_selectedFruit);
      getRuta(_selectedFruit);

    });
  }

  Widget Map(){
    var zoom = MinMaxZoomPreference(11.3, null);

    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: zoom,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.3,
      ),
      markers: markers,
      polylines: rutas,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(markers);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Lineas'),
            backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context),
              )
          ),
          body: Container(
            child: Map(),
          ),
          floatingActionButton: DropdownButton(
              value: _selectedFruit,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem)),
    );
  }
}
