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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Container(
        height: 300,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 0,
          runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            OutlineButton(
              child: Text("A"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("B"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("C"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("D"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("E"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("A"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("B"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("C"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("D"),
              onPressed: () {},
            ),
            Container(
              width: 100,
              height: 80,
              child: OutlineButton(
                child: Text("E"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
