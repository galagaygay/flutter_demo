import 'package:flutter/material.dart';

///Center既中心定位控件，能够将子控件放在其内部中心。
class LayoutCenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Center中心定位"),
      ),//AppBar
      body: new Center(
        child: new Text(
          "这是放在Center布局中的文本控件"
        ),
      ),//Center
    ); //Scaffold
  } //Widget build
}