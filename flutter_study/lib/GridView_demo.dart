import 'package:flutter/material.dart';
import 'package:flutterstudy/Post.dart';

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewDemo"),
      ),
//先看静态方式哦
//      body: GridStaticViewDemo(),
//      body: GridAutoViewDemo(),
//    body: GridAutoExtentViewDemo(),
      body: GridBuilderViewDemo(),
    );
  }
}

//1静态方式
class GridStaticViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
//      整体gridview 与视图的间隙
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,

      children: <Widget>[
        Container(
          color: Colors.grey[300],
          alignment: Alignment(0, 0),
          child: Text("item"),
        ),
        Container(
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: Text("item"),
        ),
        Container(
          color: Colors.grey[300],
          child: Text("item"),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.grey[300],
          child: Text("item"),
          alignment: Alignment.center,
        ),
        Container(
          color: Colors.grey[300],
          child: Text("item"),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

//2动态方式
class GridAutoViewDemo extends StatelessWidget {
  List<Widget> _buildGridChildWdgets(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey,
        child: Image.network(
          posts[index].imageUrl,
          fit: BoxFit.cover,
        ),

//      child: ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
//      crossAxisCount: 1, 这个时候就类似listview效果了
      crossAxisCount: 2,
//      整体gridview 与视图的间隙
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
//      改变方向，就类似pageview了
//      scrollDirection: Axis.horizontal,
      children: _buildGridChildWdgets(posts.length),
    );
  }
}

//3动态方式
class GridAutoExtentViewDemo extends StatelessWidget {
  List<Widget> _buildGridChildWdgets(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey,
        child: Image.network(
          posts[index].imageUrl,
          fit: BoxFit.cover,
        ),

//      child: ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
//      宽度，自动计算列数，跟scrollDirection 有关系
      maxCrossAxisExtent: 150,
//      整体gridview 与视图的间隙
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
//      scrollDirection: Axis.horizontal,
      children: _buildGridChildWdgets(posts.length),
    );
  }
}

//4动态方式
class GridBuilderViewDemo extends StatelessWidget {
  Widget _builderGridView(BuildContext context, int index) {
    return Container(
      color: Colors.grey,
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
//      child: ,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemBuilder: _builderGridView,
      itemCount: posts.length,
//这里就是 GridView.count
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//        crossAxisSpacing: 16,
//        mainAxisSpacing: 16,
//      ),
      //这里就是 GridView.extent
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
