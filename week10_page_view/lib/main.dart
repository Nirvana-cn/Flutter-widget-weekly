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
      home: MyHomePage(title: 'PageView '),
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
  final _controller = PageController(initialPage: 0,  viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        pageSnapping: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.redAccent,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.amber,
          ),
        ],
        onPageChanged: (int page) {
          print("Current Page: " + page.toString());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.jumpToPage(0);
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
