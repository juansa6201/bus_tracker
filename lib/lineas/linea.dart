import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Set<Marker> markers = Set();
void getData(linea) async {
  List buses;

  Dio dio = new Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };
  Response response=await dio.get("https://200.123.180.122:5743/rest/posicionesBuses/"+linea);  //CERTIFICATE_VERIFY_FAILED:ok
  buses = response.data['posiciones'];
  markers.clear();
    buses.forEach((value){
      if (int.parse(linea) >= 10 && int.parse(linea) <= 19 || int.parse(linea) >= 60 && int.parse(linea) <= 68){
      var marker = Marker(markerId: MarkerId(value['interno']),
        draggable: false,
        icon: BitmapDescriptor.fromAsset('assets/coniferal.png',),
        position: LatLng(value["latitud"], value["longitud"]),
        rotation: value["orientacion"],
        infoWindow: InfoWindow(title: "Interno" , snippet: value["interno"]),
      );
      markers.add(marker);
      }else{
        var marker = Marker(markerId: MarkerId(value['interno']),
          draggable: false,
          icon: BitmapDescriptor.fromAsset('assets/ersa.png',),
          position: LatLng(value["latitud"], value["longitud"]),
          rotation: value["orientacion"],
          infoWindow: InfoWindow(title: "Interno" , snippet: value["interno"]),
        );
        markers.add(marker);
      }
    });}