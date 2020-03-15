import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ComponentsButton"),
      ),
      body: ListView(
        children: <Widget>[
          ListItemDemo(
              title: "FloatingActionButton",
              pageWidget: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.blueAccent,
//      shape: BeveledRectangleBorder(
//        borderRadius: BorderRadius.circular(30),
//      ),
    );

    final Widget _floatingActionButtonExpand = FloatingActionButton.extended(
      onPressed: () {},
      label: Text("add"),
      icon: Icon(Icons.add),
    );
    return Scaffold(
      appBar: AppBar(title: Text("FloatingActionButtonDemo")),
      floatingActionButton: _floatingActionButton,
//      float 不重合，docked 重合
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: _floatingActionButtonExpand,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.airplanemode_active),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.card_membership),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.airplanemode_active),
                  color: Colors.transparent,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.directions_transit),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.directions_car),
                  color: Colors.white,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemDemo extends StatelessWidget {
  final String title;
  final Widget pageWidget;

  ListItemDemo({this.title, this.pageWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return pageWidget;
        }));
      },
    );
  }
}
