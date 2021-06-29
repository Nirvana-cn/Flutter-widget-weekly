import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BackdropFilter'),
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
      body: w3,
    );
  }
}

Widget w1 = Center(
  child: Container(
    width: 200,
    height: 200,
    child: Stack(
      children: [
        Positioned(
          left: 0,
          child: Container(
            width: 100,
            height: 200,
            color: Colors.lightBlue,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 100,
            height: 200,
            color: Colors.lightGreen,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.matrix(Matrix4.skewX(0.1).storage),
          //高斯模糊
          //filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Colors.black.withOpacity(0.0),
          ),
        ),
      ],
    ),
  ),
);

Widget w2 = Container(
  width: double.infinity,
  height: double.infinity,
  color: Colors.grey,
  child: Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          "images/test.jpeg",
          fit: BoxFit.fill,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Text("Hello World!", style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    ],
  ),
);

Widget w3 = Container(
  width: double.infinity,
  height: double.infinity,
  color: Colors.grey,
  child: Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          "images/test.jpeg",
          fit: BoxFit.fill,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 200,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Text("Hello World!", style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    ],
  ),
);