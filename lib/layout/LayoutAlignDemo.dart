import 'package:flutter/material.dart';

///Align控件即对齐控件，能将子控件所指定方式对齐，并根据子控件的大小调整自己的大小。
///
/// bottomCenter (0.5, 1.0)    底部中心
/// bottomLeft   (0.0, 1.0)    左下角
/// bottomRight  (1.0, 1.0)    右下角
/// center       (0.5, 0.5)    水平垂直居中
/// centerLeft   (0.0, 0.5)    左边缘中心
/// centerRight  (1.0, 0.5)    右边缘中心
/// topCenter    (0.5, 0.0)    顶部中心
/// topLeft      (0.0, 0.0)    左上角
/// topRight     (1.0, 0.0)    右上角
///
class LayoutAlignDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "Align(对齐布局)"
        ), //Text
      ), //AppBar
      body: new Stack(
        children: <Widget>[
          new Align(
            //设置对齐方式
            alignment: new FractionalOffset(0.0, 1.0),
            child: new Image.network(
              "http://up.qqjia.com/z/25/tu32710_10.jpg",
              scale: 2.0,
            ), //Image.network
          ), //Align
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.network(
              "http://up.qqjia.com/z/25/tu32710_11.jpg",
              scale: 2.0,
            ), //Image.network
          ), //Align
        ], //<Widget>[]
      ), //Stack
    ); //Scaffold
  } //Widget build
}