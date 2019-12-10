import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Transform'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget myWidget = Container(
    width: 80,
    height: 80,
    color: Colors.blue,
  );

  Widget getMyWidget(String string) {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 80,
      color: Colors.blue,
      child: Text(
        string,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            getMyWidget("No Transfrom"),
            Transform.translate(
              offset: Offset(50, 0),
              child: getMyWidget("向右平移50"),
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: getMyWidget("旋转45度"),
            ),
            Transform.scale(
              scale: 1.5,
              child: getMyWidget("放大1.5倍"),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(0.6),
              alignment: FractionalOffset.center,
              child: getMyWidget("3D视角"),
            )
          ],
        ),
      ),
    );
  }
}
