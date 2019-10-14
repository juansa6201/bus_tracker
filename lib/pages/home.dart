import 'package:flutter/material.dart';
import 'package:bus_tracker/pages/linea.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:bus_tracker/pages/points.dart';
import 'package:bus_tracker/fetch/fetch_ruta.dart';
import 'package:bus_tracker/pages/consulta.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stado = true;

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Todo Bus Cordoba"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new SizedBox(
                          height: 200.0,
                          width: 350.0,
                          child: Carousel(
                            images: [
                              Image.asset('assets/tarjeta.png'),
                              Image.asset('assets/tarjeta.png'),
                              Image.asset('assets/tarjeta.png')
                            ],
                            dotSize: 4.0,
                            dotSpacing: 15.0,
                            dotColor: Colors.black,
                            dotIncreasedColor: Colors.blueAccent,
                            autoplayDuration: Duration(milliseconds: 3000),
                            indicatorBgPadding: 5.0,
                            dotBgColor: Colors.white,
                            borderRadius: true,
                          )),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Saldo()),
                                  ),
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/bus_stop.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Consultar Saldo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 0,
                                      fontSize: 15),
                                ),
                              ])),
                          new FlatButton(
                              onPressed: () {
                                markers.clear();
                                rutas.clear();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                              },
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/lineas.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Lineas",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 0,
                                      fontSize: 15),
                                )
                              ]))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      new Row(
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () {
                                markers.clear();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Points()),
                                );
                              },
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/card.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Puntos de venta",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 0,
                                      fontSize: 15),
                                )
                              ])),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
