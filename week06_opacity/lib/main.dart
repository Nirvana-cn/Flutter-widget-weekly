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
      home: MyHomePage(title: 'Opacity'),
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
  double _opacity = 1.0;

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
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              child: InkWell(
                onTap: (){
                  setState((){
                    _opacity = 0.2;
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
