import 'package:flutter/material.dart';

/// 水平布局
/// Row控件即水平布局控件，能够将子控件水平排列。
///
/// Row子控件有灵活与不灵活的两种，Row首先列出不灵活的子控件，减去它们的总宽度，计算还有多少可用的空间。
/// 然后Row按照 Flexible.flex 属性确定的比例在可用空间中列出灵活的子控件。
/// 要控制灵活子控件,需要使用Flexible控件：
class LayoutRowDemo extends StatelessWidget {
  static var routeName = "/LayoutRowDemo";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row水平布局"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
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
                  //设置按钮形状，只要是ShapeBorder子类进行，这我们使用的是圆角的矩形
                  shape: new RoundedRectangleBorder(
                    //设置边框的圆角半径
                      borderRadius: const BorderRadius.all(
                        //转换出半径值
                          const Radius.circular(9.3)
                      )
                  ),
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
            new Row(
              //主轴对齐，spaceEvenly--均匀对齐
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
              ], //<Widget>[]
            ), //Row
            new Row(
              // 主轴对齐，spaceAround--在第一个和最后一个孩子之前和之后，
              // 均匀地在儿童之间以及该空间的一半处放置空闲空间。
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
              ], //<Widget>[]
            ), //Row
            new Row(
              //主轴对齐，spaceBetween--两端分别左右，中间的分散对齐
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
              ], //<Widget>[]
            ), //Row
            new Row(
              //主轴对齐，center--居中
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
              ], //<Widget>[]
            ), //Row
            new Row(
              //主轴对齐，end--居右
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
                new Image.asset(
                  "images/20180309142057.png",
                ), //Image.asset
              ], //<Widget>[]
            ), //Row
          ], // <Widget>[]
        ), //Column
      ), //Container
    ); //Scaffold
  } //Widget build
}