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
      home: MyHomePage(title: 'SizedBox'),
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
              width: 200,
              height: 200,
              color: Colors.green,
              child: Text("200*200"),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100, height: 100),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
                child: Text("100*100 with ConstrainedBox"),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Text("100*100 with SizedBox"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Text("When width is infinity in SizedBox"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
