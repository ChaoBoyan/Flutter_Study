
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomTabbarView extends StatefulWidget{
  int  index;
  BottomTabbarView({Key key ,@required this.index}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
//    return tabbarView(currentIndex: currentIndex);
  return tabbarView();
  }

}


class tabbarView extends State<BottomTabbarView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      onTap: selectIndexAction,
      currentIndex: widget.index,
      selectedFontSize: 11,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页",)),
        BottomNavigationBarItem(icon: Icon(Icons.query_builder),title: Text("历史")),
        BottomNavigationBarItem(icon: Icon(Icons.query_builder,color: Colors.transparent,),title: Text("发布")),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),title: Text("购物车")),
        BottomNavigationBarItem(icon: Icon(Icons.desktop_mac),title: Text("我的")),
      ],
    );
  }

  void  selectIndexAction(int index){
    setState(() {
      widget.index = index;
      print(index);
    });
  }
}
