import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
void main() => runApp(Saldo());

void getSaldo() async {


  Dio dio = new Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  Response response = await dio.get(
      "https://200.123.180.122:5743/rest/getSaldoCaptcha/2479739/ybpwa"); //CERTIFICATE_VERIFY_FAILED:ok
  print(response);

}


class Saldo extends StatefulWidget {
  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {


  final tarjeta = TextEditingController();
  final captcha = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tarjeta.dispose();
    captcha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Saldo"),
          backgroundColor: Colors.blueAccent,
        ),
        body: new Center(child: Text("Proximamente",style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,))/*Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TextField(
                      controller: tarjeta,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Introduce el numero de la tarjeta',
                      ),
                    ),
                    TextField(
                      controller: captcha,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Introduce el captcha',
                      ),
                    ),
                    new FloatingActionButton(
                      onPressed: () {
                        getSaldo();
                        return Column(
                          children: <Widget>[Text("xd")],
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        )*/);
  }
}
