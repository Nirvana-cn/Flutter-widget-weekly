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
      home: MyHomePage(title: 'InheritedModel'),
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
        child: DataContainer(),
      ),
    );
  }
}

class DataContainer extends StatefulWidget {
  @override
  DataContainerState createState() => DataContainerState();
}

class DataContainerState extends State<DataContainer> {
  int num1 = 0;

  void incNum1() {
    setState(() {
      this.num1++;
    });
  }

  int num2 = 0;

  void incNum2() {
    setState(() {
      this.num2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Inherited(
        num1: num1,
        num2: num2,
        parent: this,
        child: const Child()
    );
  }
}

class Child extends StatelessWidget {
  const Child();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Counter1(),
        Counter2(),
      ],
    );
  }
}

class Inherited extends InheritedModel<String> {
  final int num1;
  final int num2;
  final DataContainerState parent;

  static Inherited of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<Inherited>(context, aspect: aspect);
  }

  Inherited({
    Key key,
    @required Widget child,
    this.num1,
    this.num2,
    this.parent,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(Inherited oldWidget) {
    return num1 != oldWidget.num1 || num2 != oldWidget.num2;
  }

  @override
  bool updateShouldNotifyDependent(Inherited oldWidget,
      Set<String> dependencies) {
    var updateA =  num1 != oldWidget.num1 && dependencies.contains('count1');
    var updateB = num2 != oldWidget.num2 && dependencies.contains('count2');
    return updateA || updateB;
  }
}

class Counter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Inherited c = Inherited.of(context, 'count1');
    return RaisedButton(
      child: Text('${c.num1}'),
      onPressed: c.parent.incNum1,
    );
  }
}

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Inherited c = Inherited.of(context, 'count2');
    return RaisedButton(
      child: Text('${c.num2}'),
      onPressed: c.parent.incNum2,
    );
  }
}
