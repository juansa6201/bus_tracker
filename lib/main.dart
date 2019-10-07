import 'package:flutter/material.dart';
import 'package:bus_tracker/map.dart';
import 'package:bus_tracker/home.dart';

void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.teal,
  ),
  home: FirstScreen(),
));