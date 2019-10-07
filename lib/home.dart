import 'package:flutter/material.dart';
import 'package:bus_tracker/map.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
                              onPressed: () => print("xd"),
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/bus_stop.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Paradas",
                                  style: TextStyle(fontWeight: FontWeight.bold, height: 0, fontSize: 15),
                                ),
                              ])),
                          new FlatButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyApp()),
                              ),
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/lineas.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Lineas",
                                  style: TextStyle(fontWeight: FontWeight.bold, height: 0, fontSize: 15),
                                )
                              ]))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      new Row(
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () => print("xd"),
                              child: Column(children: <Widget>[
                                Image.asset(
                                  "assets/ruta.png",
                                  height: 200,
                                  width: 150,
                                ),
                                Text(
                                  "Ruta",
                                  style: TextStyle(fontWeight: FontWeight.bold, height: 0, fontSize: 15),
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
