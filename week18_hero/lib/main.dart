import 'package:flutter/material.dart';

import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:{
        "detail":(context) => Detail(),
      } ,
      home: MyHomePage(title: 'Hero'),
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
  Widget placeholderBuilder(BuildContext context, Size herSize, Widget child) {
    return Container(
      width: 90,
      height: 90,
      color: Colors.amber,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "detail");
                },
                child: Hero(
                  tag: "icon",
                  placeholderBuilder: placeholderBuilder,
                  child: Icon(
                    Icons.camera_alt,
                    size: 90,
                    color: Colors.green,
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
