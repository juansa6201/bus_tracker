import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bus_tracking/map.dart';
import 'package:bus_tracking/lineas/linea70.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp2());
}

// the root widget of our application
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget Boton(linea) {
      return RawMaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        child: new Text(linea),
        shape: new CircleBorder(),
        elevation: 2.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(20.0),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Building layouts"),
        ),
        body: Container(child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("10"),
                  Boton("11"),
                  Boton("12"),
                  Boton("13"),
                  Boton("14"),
                  Boton("15"),
                  Boton("16"),
                  Boton("17"),
                  Boton("18"),
                  Boton("19")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("20"),
                  Boton("21"),
                  Boton("22"),
                  Boton("23"),
                  Boton("24"),
                  Boton("25"),
                  Boton("26"),
                  Boton("27"),
                  Boton("28"),
                  Boton("29"),
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("30"),
                  Boton("31"),
                  Boton("32"),
                  Boton("33"),
                  Boton("34"),
                  Boton("35"),
                  Boton("36")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("40"),
                  Boton("41"),
                  Boton("42"),
                  Boton("43"),
                  Boton("44"),
                  Boton("45")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("50"),
                  Boton("51"),
                  Boton("52"),
                  Boton("53"),
                  Boton("54")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("60"),
                  Boton("61"),
                  Boton("62"),
                  Boton("63"),
                  Boton("64"),
                  Boton("65"),
                  Boton("66"),
                  Boton("67"),
                  Boton("68")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("70"),
                  Boton("71"),
                  Boton("72"),
                  Boton("73"),
                  Boton("74"),
                  Boton("75")
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Boton("80"),
                  Boton("81"),
                  Boton("82"),
                  Boton("83"),
                  Boton("84"),
                  Boton("85")
                ],
              ),
            ),
          ]),
        ),
        ),
      ),
    );
  }
}

// uncomment the section of code below that you want to run

// initial setup

//Widget myLayoutWidget() {
//  return Text("Hello world!");
//}

// padding

//Widget myLayoutWidget() {
//  return Padding(
//    padding: EdgeInsets.all(8.0),
//    child: Text("Hello world!"),
//  );
//}

// center

//Widget myLayoutWidget() {
//  return Center(
//    child: Text(
//      "Hello world!",
//      style: TextStyle(fontSize: 30),
//    ),
//  );
//}

// align

//Widget myLayoutWidget() {
//  return Align(
//    alignment: Alignment.topCenter,
//    child: Text(
//      "Hello",
//      style: TextStyle(fontSize: 30),
//    ),
//  );
//}

// container

//Widget myLayoutWidget() {
//  return Container(
//    margin: EdgeInsets.all(30.0),
//    padding: EdgeInsets.all(10.0),
//    alignment: Alignment.topCenter,
//    width: 200,
//    height: 100,
//    decoration: BoxDecoration(
//      color: Colors.green,
//      border: Border.all(),
//    ),
//    child: Text("Hello", style: TextStyle(fontSize: 30)),
//  );
//}

// rows

// columns

// expanded

//Widget myLayoutWidget() {
//  return Row(
//    children: [
//      Expanded(child: Icon(Icons.home)),
//      Expanded(child: Icon(Icons.home)),
//      Expanded(child: Icon(Icons.home)),
//      Expanded(child: Icon(Icons.home)),
//    ],
//  );
//}

// flex

//Widget myLayoutWidget() {
//  return Row(
//    children: [
//      Expanded(
//        flex: 7,
//        child: Container(
//          color: Colors.green,
//        ),
//      ),
//      Expanded(
//        flex: 3,
//        child: Container(
//          color: Colors.yellow,
//        ),
//      ),
//    ],
//  );
//}

// stacks

//Widget myLayoutWidget() {
//  return Stack(
//    children: [
//      Icon(Icons.home),
//      Icon(Icons.home),
//      Icon(Icons.home),
//      Icon(Icons.home),
//    ],
//  );
//}

//Widget myLayoutWidget() {
//  return Stack(
//
//    // any unpositioned children (our text) will be aligned at the bottom right
//    alignment: Alignment.bottomRight,
//
//    children: [
//
//      // first (bottom) child in the stack
//      Image.asset('images/sheep.jpg'), //            <--- image
//
//      // second child in the stack
//      Padding(
//        padding: EdgeInsets.all(16.0),
//        child: Text(
//          'Baaaaaa', //                              <--- text
//          style: TextStyle(fontSize: 30),
//        ),
//      ),
//
//    ],
//  );
//}

// complex layouts

//Widget myLayoutWidget() {
//  return Column(
//    children: [
//      Row(
//        children: [
//          Icon(Icons.favorite),
//          Text('BEAMS'),
//        ],
//      ),
//      Text('description...'),
//      Row(
//        children: [
//          Text('EXPLORE BEAMS'),
//          Icon(Icons.arrow_forward),
//        ],
//      ),
//    ],
//  );
//}

//Widget myLayoutWidget() {
//
//  // wrap everything in a purple container
//  return Container(
//    margin: EdgeInsets.all(16.0),
//    padding: EdgeInsets.all(16.0),
//    decoration: BoxDecoration(
//      color: Colors.purple[900],
//      border: Border.all(),
//      borderRadius: BorderRadius.all(Radius.circular(3.0)),
//    ),
//
//    // column of three rows
//    child: Column(
//
//      // this makes the column height hug its content
//      mainAxisSize: MainAxisSize.min,
//      children: [
//
//        // first row
//        Row(
//          children: [
//            Padding(
//              padding: EdgeInsets.only(right: 8.0),
//              child: Icon(Icons.favorite,
//                color: Colors.green,
//              ),
//            ),
//            Text(
//              'BEAMS',
//              style: TextStyle(
//                color: Colors.white,
//              ),
//            ),
//          ],
//        ),
//
//        // second row (single item)
//        Padding(
//          padding: EdgeInsets.symmetric(
//            vertical: 16.0,
//            horizontal: 0,
//          ),
//          child: Text('Send programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.',
//            style: TextStyle(
//              color: Colors.white,
//            ),
//          ),
//        ),
//
//        // third row
//        Row(
//          children: [
//            Text('EXPLORE BEAMS',
//              style: TextStyle(
//                color: Colors.green,
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(left: 8.0),
//              child: Icon(Icons.arrow_forward,
//                color: Colors.green,
//              ),
//            ),
//          ],
//        ),
//
//      ],
//    ),
//  );
//}

// first row as a function

//Widget firstRow() {
//  return Row(
//    children: [
//      Padding(
//        padding: EdgeInsets.only(right: 8.0),
//        child: Icon(Icons.favorite,
//          color: Colors.green,
//        ),
//      ),
//      Text(
//        'BEAMS',
//        style: TextStyle(
//          color: Colors.white,
//        ),
//      ),
//    ],
//  );
//}

// first row as a custom widget

//class FirstRow extends StatelessWidget {
//  // the build method is required when creating a StatelessWidget
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: [
//        Padding(
//          padding: EdgeInsets.only(right: 8.0),
//          child: Icon(Icons.favorite,
//            color: Colors.green,
//          ),
//        ),
//        Text(
//          'BEAMS',
//          style: TextStyle(
//            color: Colors.white,
//          ),
//        ),
//      ],
//    );
//  }
//}
