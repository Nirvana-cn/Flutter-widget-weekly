import 'dart:math';

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
      home: MyHomePage(title: 'SliverList&Grid'),
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
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 300,
          //     child: ListView.builder(
          //       itemCount: 50,
          //       itemExtent: 50.0,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           height: 50,
          //           color: randomColor(),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 50,
                color: randomColor(),
              ),
              childCount: 10,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 5),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: randomColor(),
              ),
              childCount: 40,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0,
            ),
          )
        ],
      ),
    );
  }
}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
