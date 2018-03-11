import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// AnimatedWidget类允许您从setState()调用中的动画代码中分离出窗口小部件代码。
/// AnimatedWidget不需要维护一个State对象来保存动画。
///
/// 通过这种方式我们将不用再调用LogoApp2中的setState进行页面更新
///
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ), //Container
    ); //Center
  } //Widget build
}

class LogoApp2 extends StatefulWidget {
  _LogoAppState2 createState() => new _LogoAppState2();
}

class _LogoAppState2 extends State<LogoApp2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this
    ); //AnimationController
    animation = new Tween(
        begin: 0.0,
        end: 300.0
    ).animate(controller);
    controller.forward();
  } //initState

  @override
  Widget build(BuildContext context) {
    return new AnimatedLogo(
        animation: animation
    ); //AnimatedLogo
  } //Widget build


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } //dispose
}
