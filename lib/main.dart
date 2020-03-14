import 'package:flutter/material.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:bus_tracker/pages/home.dart';
import 'package:permission_handler/permission_handler.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  final PermissionHandler _permissionHandler =
  PermissionHandler();
  var result = await _permissionHandler
      .requestPermissions(
      [PermissionGroup.location]);
  print(result);
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.teal,
  ),
  home: FirstScreen(),
));}