import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bus_tracker/pages/linea.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bus_tracker/fetch/fetch.dart';
import 'package:bus_tracker/pages/points.dart';
import 'package:bus_tracker/fetch/fetch_ruta.dart';
import 'package:bus_tracker/pages/consulta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

class FirstScreen extends StatelessWidget {

  Future<void> _ackAlertIos(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: new Text("Permisos no garantizados"),
          content: new Text("No tenemos permisos para obtener tu ubicacion"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permisos no garantizados'),
          content: const Text('No tenemos permisos para obtener tu ubicacion'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
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
                          height: 185.0,
                          width: 350.0,
                          child: Center(
                            child: Text(
                              "BUS TRACKER CORDOBA",
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new FlatButton(
                              onPressed: () => Navigator.push(
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
                              onPressed: () async {
                                final PermissionHandler _permissionHandler =
                                    PermissionHandler();
                                var result = await _permissionHandler
                                    .requestPermissions(
                                        [PermissionGroup.locationWhenInUse]);
                                if (result[PermissionGroup.locationWhenInUse] ==
                                    PermissionStatus.granted) {
                                  markers.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Points()),
                                  );
                                }else{
                                  if (Theme.of(context).platform == TargetPlatform.android){
                                    _ackAlert(context);
                                  }else if(Theme.of(context).platform == TargetPlatform.iOS){
                                    _ackAlertIos(context);
                                  }
                                }
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
