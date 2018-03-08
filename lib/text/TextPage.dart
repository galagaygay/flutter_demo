import 'package:flutter/material.dart';

///Text控件的使用展示页面
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Text控件使用展示"),
        ), //appBar
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "红色+黑色删除线+25号",
                style: new TextStyle(
                  //整体颜色
                    color: const Color(0xffff0000),
                    //对文字的装饰器
                    decoration: TextDecoration.lineThrough,
                    //装饰器的颜色，如果不设置默认与color相同
                    decorationColor: const Color(0xff000000),
                    //字体大小
                    fontSize: 25.0
                ), //TextStyle
              ), //Text
              new Text(
                "橙色+下划线+24号",
                style: new TextStyle(
                  //整体颜色
                    color: const Color(0xffff9900),
                    //对文字的装饰器
                    decoration: TextDecoration.underline,
                    //字体大小
                    fontSize: 24.0
                ), //TextStyle
              ), //Text
              new Text(
                "虚线上划线+23号+倾斜",
                style: new TextStyle(
                  //对文字的装饰器
                  decoration: TextDecoration.overline,
                  //装饰器的样式
                  decorationStyle: TextDecorationStyle.dashed,
                  //字体大小
                  fontSize: 23.0,
                  //设置字体样式
                  fontStyle: FontStyle.italic,
                ), //TextStyle
              ), //Text
              new Text(
                "serif字体+24号",
                style: new TextStyle(
                  //设置字体
                  fontFamily: "serif",
                  //字体大小
                  fontSize: 24.0,
                ), //TextStyle
              ), //Text
              new Text(
                "monospace字体+24号",
                style: new TextStyle(
                  //设置字体
                    fontFamily: "monospace",
                    //字体大小
                    fontSize: 24.0,
                    //字体的厚度
                    fontWeight: FontWeight.bold
                ), //TextStyle
              ), //Text
              new Text(
                "天蓝色+24号+2行跨度",
                style: new TextStyle(
                  color: const Color(0xff4a86e8),
                  //字体大小
                  fontSize: 24.0,
                  height: 2.0,
                ), //TextStyle
              ), //Text
              new Text(
                "24号+2个字母间隔",
                style: new TextStyle(
                  //字体大小
                    fontSize: 24.0,
                    letterSpacing: 2.0
                ), //TextStyle
              ), //Text
            ], //<Widget>[]
          ), //Column,
        ) //Center
    ); //Scaffold
  } // Widget build
}