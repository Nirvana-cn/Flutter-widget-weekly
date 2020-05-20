import 'package:flutter/cupertino.dart';
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
      home: MyHomePage(title: 'ClipRRect'),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueAccent,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ClipRRect(
              clipper: MyClipper(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            ClipPath()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBXY(0, 0, 80, 80, 20, 50);
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true;
  }

}
