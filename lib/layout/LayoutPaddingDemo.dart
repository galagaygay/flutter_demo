import 'package:flutter/material.dart';

///Padding控件即填充控件，能给子控件插入给定的填充。
class LayoutPaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "Padding控件"
        ), //Text
      ), //AppBar
      body: new Padding(
        //设置用来插入孩子的空间量。EdgeInsetsGeometry子类就可以
          padding: const EdgeInsets.all(50.0),
          //子控件
          child: new Image.network(
            "http://up.qqjia.com/z/25/tu32710_4.jpg",
            scale: 2.0,
          )
      ), //Padding
    ); //Scaffold
  } //Widget build
}