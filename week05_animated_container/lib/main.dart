import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AnimatedContainer'),
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
  Color _color = Colors.red;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          width: 200,
          height: _height,
          color: _color,
          duration: Duration(seconds: 2),
          child: FlatButton(
            child: Text(
              "Click me",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                _height = 100;
                _color = Colors.green;
              });
            },
          ),
        ),
      ),
    );
  }
}
