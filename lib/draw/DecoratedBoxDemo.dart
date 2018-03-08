import 'package:flutter/material.dart';

///DecoratedBox控件会在子控件绘制之前或之后绘制一个装饰。
class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "DecoratedBox"
        ), //Text
      ), //AppBar
      //装饰盒子
      body: new DecoratedBox(
        decoration: new BoxDecoration(
          //填充使用渐变效果
          gradient: new LinearGradient(
            //定义渐变色经历的每一种颜色，至少要有两个颜色
            colors: <Color>[
              const Color(0xFF832930),
              const Color(0xFFCCCCCC),
              const Color(0xFF111133),
            ], //<Color>[]
            //开始的位置
            begin: FractionalOffset.topCenter,
            //结束的位置
            end: const FractionalOffset(1.0, 1.0),
            tileMode: TileMode.mirror,
          ), //LinearGradient
        ), //BoxDecoration
        child: new Container(
          height: 200.0,
          width: 200.0,
        ), //Container
      ), //DecoratedBox
    ); //Scaffold
  } //Widget build
}