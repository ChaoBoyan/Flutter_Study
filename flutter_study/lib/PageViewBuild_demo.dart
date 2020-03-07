import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/Post.dart';

class PageViewBuildDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
//    return SafeArea(
//        child: Stack(
//      children: <Widget>[
//        SizedBox.expand(
//          child: Image.network(
//            posts[index].imageUrl,
//            fit: BoxFit.cover,
//          ),
//        ),
//        Positioned(
//            left: 8.0,
//            bottom: 8.0,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  posts[index].title,
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//                ),
//                Text(
//                  posts[index].author,
//                  style: TextStyle(),
//                ),
//              ],
//            )),
//      ],
//    ));
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 8.0,
          bottom: 8.0 + MediaQuery
              .of(context)
              .padding
              .bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              Text(
                posts[index].author,
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return PageView.builder(
//      itemBuilder: _pageItemBuilder,
//      itemCount: posts.length,
//    );
    return Scaffold(
        appBar: AppBar(
          title: Text("PageViewBuild"),
        ),
        body: PageView.builder(
          itemBuilder: _pageItemBuilder,
          itemCount: posts.length,
        ),
    );
  }
}