import 'package:flutter/material.dart';

///手势监听使用
///
class GestureDetectorDemo extends StatefulWidget {
  static var routeName="/GestureDetectorDemo";

  @override
  _GestureDetectorDemoState createState() => new _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("点击、拖动和其他手势"),
      ), //AppBar
      body: new Container(
        decoration: new BoxDecoration(
            color: Colors.black38
        ), //BoxDecoration
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.deepOrange
          ), //BoxDecoration
          ///创建一个检测手势的小部件。 ,
          ///平移和缩放回调不能同时使用，因为scale是泛的泛集。, 只需使用缩放回调即可。 ,
          ///水平和垂直拖动回调不能同时使用，
          ///因为水平和垂直拖动的组合是一个平移。, 只需使用泛回调。
          ///默认情况下，手势检测器将语义信息贡献给辅助技术所使用的树。
          child: new GestureDetector(
            child: new SizedBox(
              height: 250.0,
              width: 150.0,
              child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.yellow
                ), //BoxDecoration
              ), //Container
            ), //SizedBox

            onTap: () {
              print("-----onTap----");
            },
            //onTap
            onTapUp: (TapUpDetails details) {
              print("-----onTapUp----");
            },
            //onTapUp
            onTapDown: (TapDownDetails details) {
              print("-----onTapDown----");
            },
            //onTapDown
            onTapCancel: () {
              print("-----onTapCancel----");
            },
            //onTapCancel
            onLongPress: () {
              print("-----长按onLongPress----");
            },
            //onLongPress
            onDoubleTap: () {
              print("-----双击onDoubleTap----");
            },
            //onDoubleTap
            onVerticalDragStart: (DragStartDetails details) {
              print(
                  "-----指针已经接触到屏幕，而且可能开始垂直移动。onVerticalDragStart----$details");
            },
            //onVerticalDragStart
            onVerticalDragUpdate: (DragUpdateDetails details) {
              print(
                  "-----与屏幕接触并垂直移动的指针沿垂直方向移动。onVerticalDragUpdate----$details");
            },
            //onVerticalDragUpdate
            onVerticalDragEnd: (DragEndDetails details) {
              print(
                  "-----以前与屏幕接触并垂直移动的指针不再与屏幕接触，并且当其停止接触屏幕时以特定速度移动。onVerticalDragEnd----$details");
            }, //onVerticalDragEnd
          ), //GestureDetector
        ), //Container
      ), //Container
    ); //Scaffold
  } //Widget build
}