import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ConstrainedBox'),
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
            Container(
              width: 100,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50.0,
                minHeight: 100.0,
                maxWidth: 400,
                maxHeight: 100,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 100.0,
                  minHeight: 50.0,
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                child: Container(
                  width: 10,
                  height: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
