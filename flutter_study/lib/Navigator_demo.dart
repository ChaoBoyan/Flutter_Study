import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        阴影
        elevation: 0.0,
        title: Text("NavigatorDemo"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(20),
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(onPressed: null, child: Text("Home")),
            FlatButton(
                onPressed: () {
//                  方式一
//                  Navigator.of(context).push(
//                    MaterialPageRoute(builder: (BuildContext context) {
//                      return NewPage(title: "NewPage");
//                    }),
//                  );
//                方式二
                Navigator.pushNamed(context, "/newpage");
                },
                child: Text("NewPage")),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;

  NewPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
