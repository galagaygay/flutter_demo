import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  static var routeName="/LogoApp";

  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //创建动画控制器
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //创建Tween动画
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    ///级联符号,此语法表示使用animate（）的返回值调用addListener（）方法。
    ///其实就是java中的链式调用
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        }); //setState
      }); //addListener
    controller.forward();
  } //initState()

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ), //Container
    ); //Center
  } //Widget build

  @override
  void dispose() {
    //释放资源，防止内存泄露
    controller.dispose();
    super.dispose();
  }
}