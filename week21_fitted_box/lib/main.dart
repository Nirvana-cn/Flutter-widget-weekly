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
      home: MyHomePage(title: 'FittedBox'),
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
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.lightBlueAccent,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: 400,
                  height: 300,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.lightBlueAccent,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Container(
                  width: 300,
                  height: 400,
                  color: Colors.greenAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
