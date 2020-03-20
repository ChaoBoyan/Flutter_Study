import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          ListItemDemo(
              title: "FlatButton", pageWidget: FloatingActionButtonDemo()),
          ListItemDemo(
              title: "RaisedButton", pageWidget: FloatingActionButtonDemo()),
          ListItemDemo(
              title: "OutlineButton", pageWidget: FloatingActionButtonDemo()),
          ListItemDemo(title: "PopMenuButton", pageWidget: PopMenuButtonDemo()),
          ListItemDemo(title: "DateTimeDemo", pageWidget: DateTimeDemo()),

//          Container + button 指定宽度
//Expanded + button 自动充满 权重flex占比份
//        buttonbar + button
        ],
      ),
    );
  }
}

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
   DateTime selectDate = DateTime.now();

  Future _selectDate() async {
   final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
    );

   if (date == null) return;

   setState(() {
     selectDate = date;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimeDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopMenuButtonDemo extends StatefulWidget {
  @override
  _PopMenuButtonState createState() => _PopMenuButtonState();
}

class _PopMenuButtonState extends State<PopMenuButtonDemo> {
  String _currentValue = "--";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PopMenuButton")),
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(_currentValue),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Home"),
                    value: "home",
                  ),
                  PopupMenuItem(
                    child: Text("Mine"),
                    value: "Mine",
                  ),
                  PopupMenuItem(
                    child: Text("Shop"),
                    value: "Shop",
                  ),
                ];
              },
              onSelected: (value) {
                print(value);
                setState(() {
                  _currentValue = value;
                });
              },
            )
          ],
        ),
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
//    shape: StadiumBorder(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("button"),
//          shape: StadiumBorder(),
//            BeveledRectangleBorder 顶端斜角
//            BoxBorder
//            CircleBorder 圆形
//            InputBorder
//            RoundedRectangleBorder 顶端圆角
//            StadiumBorder 体育场型
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.elliptical(30, 30)),
                side: BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.gavel),
              onPressed: () {},
              label: Text("RaisedButtonIcon"),
            ),
            OutlineButton(
              onPressed: () {},
              splashColor: Colors.grey[200],
              highlightedBorderColor: Colors.grey,
              child: Text("OutlineButton"),
            ),
          ],
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
