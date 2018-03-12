import 'package:flutter/material.dart';

///Flutter基础—常用控件之容器
///Container控件即容器，是一个常用的控件，基础容器的实例：
class ContainerDemo extends StatelessWidget {
  static var routeName="/ContainerDemo";

  @override
  Widget build(BuildContext context) {
    //Center控件使子控件在其内部水平和垂直居中
    return new Center(
      child: new Container(
        //width属性设置宽度为200
        width: 200.0,
        //height属性设置高度为100
        height: 200.0,
        //BoxDecoration对象描述如何绘制容器
        decoration: new BoxDecoration(
            color: Colors.white,
            //border属性给容器添加边框
            border: new Border.all(
              //边框颜色
                color: new Color(0xff6d9eeb),
                //边框宽度
                width: 6.0
            ) //Border.all
        ), //BoxDecoration
        child: new Text("这是一个容器"),
      ), //Container
    ); //Center
  } //Widget build
}