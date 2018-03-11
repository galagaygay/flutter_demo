import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  // The Tweens are static because they don't change.
  //控制透明度的动画
  static final _opacityTween = new Tween<double>(
      begin: 0.1,
      end: 1.0
  );

  //控制大小的动画
  static final _sizeTween = new Tween<double>(
      begin: 0.0,
      end: 300.0
  );

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Center(
      //创建一个使其子部分透明的小部件。
      child: new Opacity(
        //透明度
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new FlutterLogo(),
        ), //Container
      ), //Opacity
    ); //Center
  }
}

class LogoApp4 extends StatefulWidget {
  _LogoAppState4 createState() => new _LogoAppState4();
}

class _LogoAppState4 extends State<LogoApp4> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    ); //AnimationController

    //曲线的动画
    animation = new CurvedAnimation(
        parent: controller,
        //立方体动画曲线开始缓慢并快速结束。
        curve: Curves.easeIn
    ); //CurvedAnimation

    //添加动画状态监听
    animation.addStatusListener(
            (status) {
          if (status == AnimationStatus.completed) {
            //开始反向运行此动画（开始时）。
            controller.reverse();
          }
          else if (status == AnimationStatus.dismissed) {
            //开始正向运行此动画
            controller.forward();
          }
        }
    ); //addStatusListener

    controller.forward();
  }

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