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
      home: MyHomePage(title: 'Future Builder'),
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
  Future<String> _future;

  @override
  void initState() {
    super.initState();
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => '我是异步获取的数据。');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FutureBuilder(
            future: _future,
            initialData: "Initial data",
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text('None: ${snapshot.data}'),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(" Waiting: ${snapshot.data}"),
                        )
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('异步请求出错'),
                    );
                  }
                  return Center(
                    child: Text("Contents: ${snapshot.data}"),
                  );
              }
              return null;
            },
          ),
          FlatButton(
            color: Colors.grey,
            child: Text("发起异步"),
            onPressed: (){
              setState(() {
                _future = mockNetworkData();
              });
            },
          ),
        ],
      ),
    );
  }
}
