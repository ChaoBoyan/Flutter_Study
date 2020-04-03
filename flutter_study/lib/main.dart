import 'package:flutter/material.dart';
import 'package:flutterstudy/Form_demo.dart';
import 'package:flutterstudy/ListView_demo.dart';
import 'package:flutterstudy/Navigator_demo.dart';
import 'package:flutterstudy/tabbar_demo.dart';
import 'package:flutterstudy/Components.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "/newpage": (context) => NewPage(title: "NewPage_Routes"),
        "/formdemo":(context)=> FormDemo(title: "FormDemo",),
//        "/componentsButton":(context)=> ComponentsButton(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        primarySwatch: Colors.green,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//        home 可以用 initialRoute 替代 ,

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
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter = 2;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomTabbarView(index: _counter),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: listViewDemo(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
