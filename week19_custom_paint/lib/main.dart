import 'package:flutter/material.dart';

import 'children/checkerboard.dart';
import 'children/curve.dart';
import 'children/custom_rect.dart';
import 'children/draw_text.dart';
import 'children/star.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "checkerboard": (context) => Checkerboard(),
        "curve": (context) => CurveLine(),
        "text": (context) => DrawText(),
        "rect": (context) => CustomRect(),
        "star": (context) => Star(),
      },
      home: MyHomePage(title: 'CustomPaint'),
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
            RaisedButton(
              child: Text("Checkerboard"),
              onPressed: () {
                Navigator.of(context).pushNamed("checkerboard");
              },
            ),
            RaisedButton(
              child: Text("Curve"),
              onPressed: () {
                Navigator.of(context).pushNamed("curve");
              },
            ),
            RaisedButton(
              child: Text("Draw Text"),
              onPressed: () {
                Navigator.of(context).pushNamed("text");
              },
            ),
            RaisedButton(
              child: Text("CustomRect"),
              onPressed: () {
                Navigator.of(context).pushNamed("rect");
              },
            ),
            RaisedButton(
              child: Text("Star"),
              onPressed: () {
                Navigator.of(context).pushNamed("star");
              },
            ),
          ],
        ),
      ),
    );
  }
}
