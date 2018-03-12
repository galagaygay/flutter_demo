import 'package:flutter/material.dart';

///AspectRatio控件能强制子小部件的宽度和高度具有给定的宽高比，以宽度与高度的比例表示。
class LayoutAspectRatioDemo extends StatelessWidget {
  static var routeName="/LayoutAspectRatioDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AspectRatio强制比例'),
      ),
      //宽高比控件
      body: new AspectRatio(
        //设置width/height比值
        aspectRatio: 16.0 / 9.0,
        //设置内部控件
        child: new Container(
          //设置装饰
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}