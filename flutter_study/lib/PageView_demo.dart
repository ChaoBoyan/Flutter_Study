import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {

  void PageChageAction(page){
    print(page);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(

      onPageChanged: (page){
        PageChageAction(page);
      },
      controller: PageController(initialPage: 1, viewportFraction: 1),
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.orange,
//          child: Text("one")
        child: Icon(Icons.directions_bike,size: 36,),
        ),
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child:Icon(Icons.directions_car,size: 36,),
        ),
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child:Icon(Icons.airplanemode_active,size: 36,),
        ),
      ],
    );
  }
}
