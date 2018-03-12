import 'package:flutter/material.dart';

/// Stack即层叠布局控件，能够将子控件层叠排列。
///
/// Stack控件的每一个子控件都是定位或不定位，定位的子控件是被Positioned控件包裹的。
/// Stack控件本身包含所有不定位的子控件，其根据alignment定位（默认为左上角）。
/// 然后根据定位的子控件的top、right、bottom和left属性将它们放置在Stack控件上。
class LayoutStackDemo extends StatelessWidget {
  static var routeName = "/LayoutStackDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stack层叠布局"),
      ), //AppBar
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1520503873514&di=4e4d7e2c646665b9b206ae5e87ab995f&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-12-19%2F5a387cfd18684.jpg"
            ), //Image.network
            //一个控制[Stack]的子节点位置的小部件
            new Positioned(
              left: 35.0,
              right: 20.0,
              top: 90.0,
              child: new Text(
                "这是重叠在图片之上的文字 ๑•ิ.•ั๑",
                style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'serif'
                ), //TextStyle
              ), //Text
            ), //Positioned
          ], //<Widget>[]
        ), //Stack
      ), //Center
    ); //Scaffold
  } // Widget build
}