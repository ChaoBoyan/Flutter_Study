import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget{

  final String _author  = "chaoYY";
  final String _title  = "Flutter学习";
  final TextStyle _textStyle = TextStyle(color: Colors.deepOrange, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    普通文本
//      return Text(
//        "$_author, hello,《$_title》对潇潇暮雨洒江天，一番洗清秋。渐霜风凄紧，关河冷落，残照当楼。是处红衰翠减，苒苒物华休。唯有长江水，无语东流。不忍登高临远，望故乡渺邈，归思难收。叹年来踪迹，何事苦淹留？想佳人，妆楼颙望，误几回、天际识归舟。争知我，倚栏杆处，正恁凝愁！",
//        style: _textStyle,
//        textAlign: TextAlign.left,
//        maxLines: 3,
//        overflow: TextOverflow.ellipsis,
//      );

// 富文本
//  return RichText(
//    text: TextSpan(
//      text: "flutter",
//      style: TextStyle(
//        fontSize: 36.0,
//        fontStyle:FontStyle.italic,
//        color: Colors.blueAccent
//      ),
//      children: [TextSpan(
//        text: ".dart",
//        style: _textStyle,
//      ),
//    ]
//    ),
//
//  );

    return Container(
//     color: Colors.yellow[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1609287357,1273192529&fm=26&gp=0.jpg")
          ,
          fit: BoxFit.cover,
//         图片滤镜
          colorFilter: ColorFilter.mode(
              Colors.deepOrange.withOpacity(0.5),
              BlendMode.hardLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.blueAccent,
            child: Icon(Icons.directions_car,size: 58,color: Colors.white),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(10.0),
            width: 90,
            height: 90,
          ),
          Container(
//           decoration 包含color属性
//           color: Colors.blueAccent,
            child: Icon(Icons.directions_car,size: 50,color: Colors.white),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(10.0),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1),
//             边框
              border:
//             Border(
//               顶部添加一个边框
//               top: BorderSide(
//                   color: Colors.red,
//                   width: 3,
//                   style: BorderStyle.solid
//               ),
//             ),
//所有边，添加边框
              Border.all(
                color: Color.fromRGBO(3, 54, 255, 1),
                width: 3,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.horizontal(left: Radius.elliptical(30, 30)),
//           阴影
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 16),
                  color: Color.fromRGBO(3, 54, 255, 1),
//                 模糊效果，值越大，效果越明显
                  blurRadius: 25.0,
//                 阴影扩散，值越大，范围越大
                  spreadRadius:-9,
                ),
              ],
//              shape: BoxShape.circle,
//             渐变效果
//             gradient: RadialGradient(colors: [
//               Colors.yellow,
//               Colors.green
//             ]),
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.yellow
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),

            ),
          ),

        ],
      ),
    );

  }
}