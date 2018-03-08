import 'package:flutter/material.dart';

/// 水平布局
/// Row控件即水平布局控件，能够将子控件水平排列。
///
/// Row子控件有灵活与不灵活的两种，Row首先列出不灵活的子控件，减去它们的总宽度，计算还有多少可用的空间。
/// 然后Row按照 Flexible.flex 属性确定的比例在可用空间中列出灵活的子控件。
/// 要控制灵活子控件,需要使用Flexible控件：
class LayoutRowDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row水平布局"),
      ),
      body: new Row(
        children: <Widget>[
          //凸起的按钮更有层次感
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text(
              "红色按钮",
              style: new TextStyle(
                  color: Colors.white
              ), //TextStyle
            ), //Text
          ), //RaisedButton
          new Flexible(
            flex: 1,
            child: new RaisedButton(
              onPressed: () {
                print("点击了黄色按钮");
              },
              color: const Color(0xfff1c232),
              child: new Text("黄色按钮"),
            ), //RaisedButton
            fit: FlexFit.tight,
          ), //Flexible
          new RaisedButton(
            onPressed: () {
              print("粉色按钮");
            },
            color: const Color(0xffea9999),
            child: new Text("粉色按钮"),
          ) //RaisedButton
        ], //<Widget>[]
      ), //Row
    ); //Scaffold
  } //Widget build
}