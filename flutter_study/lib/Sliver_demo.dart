import 'package:flutter/material.dart';
import 'package:flutterstudy/Post.dart';

class SliverViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      改变appbar高度
//      appBar: PreferredSize(
//          child: AppBar(
//
//          ),
//          preferredSize: Size.fromHeight(180)),

//      body: ySliverGridView(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            为了  flexibleSpace 效果，隐藏返回按钮
            automaticallyImplyLeading: false,
//            title: Text("Fluuter"),
//           false 滚动appbar消失,反之不动
//            pinned: true,
//          向上滚动消失，向下滚动显示， pinned: true无效
//            floating: true,

//            就展现了 特别牛逼的效果,带渐进变化可伸缩的bar
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://resources.ninghao.org/images/white-dragon.jpg",fit: BoxFit.cover,),
              title: Text(
                "SliverAppBar",
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
//         ySliverGridView(),
          ySliverPaddingView(),
//        ySliverSafeView(),
        ],
      ),
    );
  }
}
//三个综合比较，还是SliverPaddin强啊

//没有tabbar,bottombar ,可以使用这个，但是没有padding
class ySliverSafeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverSafeArea(sliver: ySliverGridView());
  }
}

// 配合 appbar 基本可以满足很多需求，就多了一个padding属性
class ySliverPaddingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      sliver: ySliverGridView(),
    );
  }
}

//没有padding属性，局限性很大
class ySliverGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
//      没有padding属性，局限性很大
        SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10.0),
    );
  }
}
