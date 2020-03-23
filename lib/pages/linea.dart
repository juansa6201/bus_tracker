import 'dart:io';
import 'package:flutter/cupertino.dart';
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
    if (mounted) {
      super.setState(fn);
    }
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(-31.409691, -64.190843);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<String> _fruits = [
    "-",
    "Trole - Linea A",
    "Trole - Linea B",
    "Trole - Linea C",
    "Aerobus",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "45",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75"
  ];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;
  int _pos;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
     _pos = 0;

    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      if (fruit == "Trole - Linea A") {
        items.add(DropdownMenuItem(value: "1", child: Text(fruit)));
      } else if (fruit == "Trole - Linea B") {
        items.add(DropdownMenuItem(value: "2", child: Text(fruit)));
      } else if (fruit == "Trole - Linea C") {
        items.add(DropdownMenuItem(value: "3", child: Text(fruit)));
      } else if (fruit == "Aerobus") {
        items.add(DropdownMenuItem(value: "890", child: Text(fruit)));
      } else {
        items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
      }
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    print(selectedFruit);
    Timer(Duration(seconds: 1), () {
      setState(() {
        getData(_selectedFruit);
        getRuta(_selectedFruit);
      });
    });
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        getData(_selectedFruit);
      });
    });
    setState(() {
      _selectedFruit = selectedFruit;
      getData(_selectedFruit);
      getRuta(_selectedFruit);
    });
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
      markers: markers,
      polylines: rutas,
    );
  }

  Widget CustomCupertinoPicker() {
    return CupertinoPicker(
      itemExtent: 25.0,
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedFruit = _dropDownMenuItems[index].value;
        });
        print(_selectedFruit);
      },
      children: List<Widget>.generate(_fruits.length, (index) {
        return Center(
          child: Text(_fruits[index]),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
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
            floatingActionButton: platform == TargetPlatform.android
                ? DropdownButton(
                    value: _selectedFruit,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem)
                : CupertinoButton(
                    child: Text(_selectedFruit),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                height: 200.0,
                                color: Colors.white,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CupertinoButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          _selectedFruit = "-";
                                          _pos = 0;
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Expanded(
                                        child: CupertinoPicker(

                                            scrollController:
                                                new FixedExtentScrollController(

                                              initialItem: _selectedFruit == "-" ? 0: _pos,
                                            ),
                                            itemExtent: 32.0,
                                            backgroundColor: Colors.white,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                _selectedFruit =_dropDownMenuItems[index].value;
                                                _pos = index;

                                              });

                                            },
                                            children: List<Widget>.generate(
                                                _fruits.length, (index) {
                                              return Center(
                                                child: Text(_fruits[index]),
                                              );
                                            })),
                                      ),
                                      CupertinoButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            changedDropDownItem(_selectedFruit);
                                            Navigator.pop(context);
                                          })
                                    ]));
                          });
                    }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ));
  }
}
