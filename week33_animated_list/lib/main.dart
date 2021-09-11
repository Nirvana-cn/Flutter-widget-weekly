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
      home: MyHomePage(title: 'AnimatedList'),
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
  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  List<String> fruit = [
    "apple",
    "orange",
    "peach",
    "grape",
    "watermelon",
    "banana"
  ];

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
            Expanded(
              child: AnimatedList(
                key: _key,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: animation.drive(Tween(begin: 0, end: 1)),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      child: Text("水果 - ${fruit[index]}"),
                    ),
                  );
                },
                initialItemCount: fruit.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              final int index = fruit.length;
              fruit.add("mango");

              AnimatedListState state = _key.currentState;
              state.insertItem(index);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              final int index = fruit.length - 1;
              String name = fruit[index];

              AnimatedListState state = _key.currentState;
              state.removeItem(
                index,
                (context, animation) => FadeTransition(
                  opacity: animation,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text("水果 - $name"),
                  ),
                ),
              );

              fruit.removeAt(index);
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
