import 'package:flutter/material.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:bus_tracker/pages/home.dart';

void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.teal,
  ),
  home: FirstScreen(),
));