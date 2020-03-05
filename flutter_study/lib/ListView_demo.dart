import 'package:flutter/material.dart';
import 'package:flutterstudy/AppBar_demo.dart';
class listViewDemo extends StatelessWidget {

  final List<String> cellDate = [
    "AppBaeDemo","2","1","2","1","2","1","2","1","2","1","2","1","2","1","2"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
//      分割线
      separatorBuilder: (BuildContext context, int index) => new Divider(),

      itemCount: cellDate.length,
      itemBuilder: (context, index){
       return ListTile(
         title: Text("${cellDate[index]}"),
         subtitle: Text("$index"),
         trailing: Icon(Icons.navigate_next),

         onTap:(){
           gotoAppBarDemoWidget(context);
         },
       );
      },
    );
  }

  void  gotoAppBarDemoWidget(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBarView_demo()));
  }
}