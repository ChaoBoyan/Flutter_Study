import 'package:flutter/material.dart';

class NavigationBarView_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//        leading: ,
//      导航栏背景颜色
        backgroundColor: Colors.orange,
//      appbar上所有Icon widget背景颜色
        iconTheme: IconThemeData(color: Colors.green),
//          appbar上所有actions背景颜色
        actionsIconTheme: IconThemeData(color: Colors.red),
//        自定义 title属性
        textTheme: TextTheme(
          title: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
        ),
        title: Text("AppBar"),
//        是否  显示返回按钮，默认 显示
        automaticallyImplyLeading: true,
        centerTitle: true,
//        actions 多于2个，title 会偏移，得设置居中
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              }),
          IconButton(
              icon: Icon(Icons.add_a_photo),
              disabledColor: Colors.white,
              onPressed: null),
          IconButton(
              icon: Icon(Icons.phone_iphone),
              disabledColor: Colors.blue,
              onPressed: null),
        ],
      ),
      body: Text("AppBar_flutter"),
    );
  }
}
