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
      home: MyHomePage(title: 'LayoutBuilder'),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 500) {
            return Row(
              children: [
                Container(
                  width: 100,
                  height: double.infinity,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("目录区"),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("内容区"),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.orangeAccent,
                  alignment: Alignment.center,
                  child: Text("目录区"),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text("内容区"),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
