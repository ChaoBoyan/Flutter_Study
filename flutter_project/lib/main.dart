import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(
          primarySwatch: Colors.lightBlue //primarySwatch ：现在支持18种主题样本。
      ),
      home: _home(),
    );
  }
}
class _home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeState();
  }
}
class _homeState extends State<_home> {
//  List<Widget> _viewList; //创建视图数组
//  int _index = 0; //数组索引，通过改变索引值改变视图
//  @override
//  void initState() {
//    super.initState();
//    _viewList = List();
//    _viewList..add(EachView("HOME"))..add(EachView("CLOCK"));
//  }
//  _openNewPage() {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (BuildContext context) {
//      return EachView("new Pager");
//    }));
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
//          onPressed: _openNewPage,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //和底栏进行融合
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue, //底部工具栏的颜色。
        shape: CircularNotchedRectangle(),
        //设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
        child: Row(
          //里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              color: Colors.white,
//              onPressed: () {
//                setState(() {
//                  _index = 0;
//                });
//              },
            ),
            IconButton(
              icon: Icon(Icons.access_alarms, color: Colors.white),
              color: Colors.white,
//              onPressed: () {
//                setState(() {
//                  _index = 1;
//                });
//              },
            ),
          ],
        ),
      ),
//      body: _viewList[_index],
    );
  }
}
//子页面
//代码中设置了一个内部的_title变量，这个变量是从主页面传递过来的，然后根据传递过来的具体值显示在APP的标题栏和屏幕中间。
//class EachView extends StatefulWidget {
//  String _title;
//  EachView(this._title);
//  @override
//  _EachViewState createState() => _EachViewState();
//}
//class _EachViewState extends State<EachView> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text(widget._title)),
//      body: Center(child: Text(widget._title)),
//    );
//  }
//}