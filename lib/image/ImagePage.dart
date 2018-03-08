import 'package:flutter/material.dart';

/// Flutter基础—常用控件之图片 http://blog.csdn.net/hekaiyou/article/details/53204466
///
/// Image控件即图片控件，是显示图像的控件，Image控件有多种构造函数：
/// new Image，用于从ImageProvider获取图像。
/// new Image.asset，用于使用key从AssetBundle获取图像。
/// new Image.network，用于从URL地址获取图像。
/// new Image.file，用于从File获取图像。
///
/// 为了自动执行像素密度感知资源分辨率，使用AssetImage指定图像，
/// 需要确保在控件树中的图片控件上方存在MaterialApp、WidgetsApp和MediaQuery控件。
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Image加载图片"),
        ), //AppBar
        body: new Center(
            child: new Column(
              children: <Widget>[
                new Text("Image加载网络图片"),
                new Image.network(
                  //图片加载地址
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1520500619433&di=899cd04ace7bae197c5615942cc3e4b3&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-10-14%2F59e1bb9f01314.jpg",
                  //缩放比例
                  scale: 5.0,
                ), //Image.network,
                new Text("Image加载asset图片"),
                new Image.asset(
                  "images/timg.jpg",
                  //缩放比例
                  scale: 5.0,
                ), //Image.network,
              ], //<Widget>[]
            ) //Column
        ) //Center
    ); //Scaffold
  } //Widget build
}