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
      home: MyHomePage(title: 'Dismissible'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Dismissible(
              key: Key("1"),
              child: Container(
                height: 40,
                color: Colors.amber,
              ),
              background: Container(
                height: 40,
                color: Colors.amberAccent,
              ),
              secondaryBackground: Container(
                width: 100,
                height: 40,
                color: Colors.black,
              ),
              onDismissed: (direction) {
                print("First is dismissible");
              },
            ),
            Dismissible(
              key: Key("2"),
              child: Container(
                height: 40,
                color: Colors.blueAccent,
              ),
              background: Container(
                height: 40,
                color: Colors.blue,
              ),
              onDismissed: (direction) {
                print("Second is dismissible");
              },
            ),
            Dismissible(
              key: Key("3"),
              child: Container(
                height: 40,
                color: Colors.green,
              ),
              background: Container(
                height: 40,
                color: Colors.greenAccent,
              ),
              onDismissed: (direction) {
                print("Third is dismissible");
              },
            ),
          ],
        ),
      ),
    );
  }
}
