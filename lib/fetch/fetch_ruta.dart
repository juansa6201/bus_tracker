import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Set<Polyline> rutas = Set();

void getRuta(linea) async {
  List buses;
  List<LatLng> latlng = List();

  Dio dio = new Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  Response response = await dio.get(
      "https://200.123.180.122:5743/rest/rutaLinea/" +
          linea); //CERTIFICATE_VERIFY_FAILED:ok
  buses = response.data['nodos'];
  rutas.clear();

  buses.forEach((value) {
    LatLng latLang = LatLng(value['latitud'], value['longitud']);
    latlng.add(latLang);
  });

  if (int.parse(linea) >= 10 && int.parse(linea) <= 19 ||
      int.parse(linea) >= 60 && int.parse(linea) <= 68) {
    var ruta = Polyline(
        polylineId: PolylineId('1'),
        visible: true,
        color: Colors.orange,
        points: latlng,
        width: 4);
    rutas.add(ruta);
  } else if (int.parse(linea) >= 1 && int.parse(linea) <= 3 ||
      int.parse(linea) == 890) {
    var ruta = Polyline(
        polylineId: PolylineId('1'),
        visible: true,
        color: Colors.blue,
        points: latlng,
        width: 4);
    rutas.add(ruta);
  } else {
    var ruta = Polyline(
        polylineId: PolylineId('1'),
        visible: true,
        color: Colors.red,
        points: latlng,
        width: 4);
    rutas.add(ruta);
  }
}
