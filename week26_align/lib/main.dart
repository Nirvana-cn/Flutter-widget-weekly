import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Align'),
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
        child: Container(
          width: 500,
          height: 500,
          color: Colors.grey,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Align(
                alignment: Alignment(0.2, 0.2),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.greenAccent,
                ),
              ),
              Align(
                alignment: FractionalOffset(0.2, 0.2),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.lightGreenAccent,
                ),
              ),
              Align(
                alignment: FractionalOffset(0.2, -0.2),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}