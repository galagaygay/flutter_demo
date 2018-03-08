import 'package:flutter/material.dart';

///SizedBox控件能强制子控件具有特定宽度、高度或两者都有
class LayoutSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "SizedBox(强制大小)"
        ), //Text
      ), //AppBar
      body: new SizedBox(
        width: 250.0,
        height: 300.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ), //BoxDecoration
        ), //Container
      ), //SizedBox
    ); //Scaffold
  } //Widget build
}