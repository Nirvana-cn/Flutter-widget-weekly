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
      home: MyHomePage(title: 'Draggable'),
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
  bool v1 = true;
  bool v2 = true;
  String text = "container";

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
              flex: 1,
              child: Container(
                color: Colors.lightBlueAccent,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: v1,
                        child: Draggable<int>(
                          data: 1,
                          child: Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            color: Colors.pink,
                            child: Text("square 1"),
                          ),
                          feedback: MovingBox(),
                          childWhenDragging: GreyBox(),
                        ),
                      ),
                      Visibility(
                        visible: v2,
                        child: Draggable<int>(
                          data: 2,
                          child: Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            color: Colors.yellowAccent,
                            child: Text("square 2"),
                          ),
                          feedback: MovingBox(),
                          childWhenDragging: GreyBox(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.lightGreenAccent,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: DragTarget<int>(
                      builder: (BuildContext context,
                          List<Object> candidateData,
                          List<dynamic> rejectedData) {
                        print(candidateData);
                        print(rejectedData);

                        return Container(
                          width: 100,
                          height: 100,
                          color: v1 ? Colors.white : Colors.pink,
                          alignment: Alignment.center,
                          child: Text(text),
                        );
                      },
                      onWillAccept: (int value) {
                        print("onWillAccept $value");
                        if (value == 1) {
                          return true;
                        }

                        return false;
                      },
                      onAccept: (data) {
                        print("onAccept $data");
                        setState(() {
                          v1 = false;
                          text = "square 1";
                        });
                      },
                      onLeave: (data) {
                        print("onLeave $data");
                      },
                    ),
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

class GreyBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey,
    );
  }
}

class MovingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.orangeAccent,
      alignment: Alignment.center,
      child: Text(
        "moving",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
