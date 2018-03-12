import 'package:flutter/material.dart';

/// Opacity控件能调整子控件的不透明度，
/// 使子控件部分透明，不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
class OpacityDemo extends StatelessWidget {
  static var routeName="/OpacityDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Opacity(不透明)"),
      ), //AppBar
      body: new Center(
        //创建Opacity控制内部子控件透明度的控件容器
          child: new Opacity(
            //1.0全不透明。 0.0完全透明的
            opacity: 0.1,
            child: new Container(
              width: 300.0,
              height: 300.0,
              decoration: new BoxDecoration(
                  color: Colors.redAccent
              ), //BoxDecoration
            ), //Container
          ) //Opacity
      ), //Center
    ); //Scaffold
  } //Widget build
}