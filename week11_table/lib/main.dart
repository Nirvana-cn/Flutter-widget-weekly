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
      home: MyHomePage(title: 'Table'),
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
        child: Table(
//        defaultColumnWidth: FractionColumnWidth(0.25),
          defaultColumnWidth: FixedColumnWidth(130),
          columnWidths: {
            0: FractionColumnWidth(0.3),
            1: FractionColumnWidth(0.1),
            2: FractionColumnWidth(0.2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(
            color: Colors.blueGrey,
            width: 2,
          ),
          children: [
            TableRow(
              children: [
                WrapperWidget("1", height: 100, color: Colors.greenAccent,),
                WrapperWidget("2"),
                WrapperWidget("3"),
              ]
            ),
            TableRow(
                children: [
                  WrapperWidget("4"),
                  WrapperWidget("5", height: 70, color: Colors.green,),
                  WrapperWidget("6"),
                ]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class WrapperWidget extends StatelessWidget {
  final String string;
  final double width;
  final double height;
  final Color color;

  WrapperWidget(this.string, {
    this.width = 50,
    this.height = 50,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      width: width,
      height: height,
      color: color,
      child: Text(string),
    );
  }
}
