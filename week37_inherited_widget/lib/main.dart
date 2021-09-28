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
      home: MyHomePage(title: 'InheritedWidget'),
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
  FavoriteFruit _fruit;

  @override
  void initState() {
    super.initState();
    _fruit = FavoriteFruit("apple", "peach");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SharedDataWidget(
        fruit: _fruit,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: WrapperWidget(),
            ),
            Expanded(
              flex: 1,
              child: Align(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _fruit = FavoriteFruit("watermelon", "banana");
                    });
                  },
                  child: Text("Update Data"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

class SharedDataWidget extends InheritedWidget {
  final FavoriteFruit fruit;
  final Widget child;

  const SharedDataWidget({Key key, @required this.fruit, @required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return oldWidget.fruit != fruit;
  }

  static SharedDataWidget of(BuildContext context) {
    SharedDataWidget instance =
        context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
    assert(instance != null, 'No SharedDataWidget found in context');
    return instance;
  }
}

class WrapperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DetailWidget(),
    );
  }
}

class DetailWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    String firstFavorite = SharedDataWidget.of(context).fruit.firstFavorite;
    String secondFavorite = SharedDataWidget.of(context).fruit.secondFavorite;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("My favorite fruit —— $firstFavorite"),
        Text("My second favorite fruit —— $secondFavorite"),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("WrapperWidget didChangeDependencies");
  }
}

class FavoriteFruit {
  String firstFavorite;
  String secondFavorite;

  FavoriteFruit(this.firstFavorite, this.secondFavorite);

  @override
  bool operator ==(Object other) {
    if (!(other is FavoriteFruit)) {
      return false;
    }
    FavoriteFruit old = other as FavoriteFruit;
    return firstFavorite == old.firstFavorite && secondFavorite == old.secondFavorite;
  }
}
