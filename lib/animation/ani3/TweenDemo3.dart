import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/ani3/BarChartPainter3.dart';

/// 补间，它是构建动画代码的一个非常简单的概念，
/// 主要作用是用面向对象的方法替代之前面向过程的方法。
/// tween是一个值，它描述了其他值的空间中的两个点之间的路径，
/// 比如条形图的动画值从0运行到1。
class TweenDemo3 extends StatefulWidget {
  static var routeName="/TweenDemo3";

  @override
  State<StatefulWidget> createState() {
    return new _TweenDemoState2();
  } //createState
} //TweenDemo

class _TweenDemoState2 extends State<TweenDemo3> with TickerProviderStateMixin {
  //随机函数
  final random = new Random();

  //动画控制器
  AnimationController animation;

  //补间动画
  BarTween tween;


  @override
  void initState() {
    super.initState();
    print("执行了方法===========initState");

    //初始化动画控制器
    animation = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200)
    ); //AnimationController

    //创建Tween补间动画
    tween = new BarTween(
        new Bar.empty(),
        new Bar.random(random)
    ); //Tween

    //执行动画
    animation.forward();
  } //initState

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  //更改数据参数，通知页面进行刷新操作
  void _changeData() {
    print("执行了方法===========_changeData");

    setState(() {
      //创建补间动画
      tween = new BarTween(
        //设置动画开始的点是上次动画结束的位置
        //返回给定动画的当前值的插值。
          tween.evaluate(animation),
          new Bar.random(random)
      );

      //启动动画
      animation.forward(from: 0.0);
    }); //setState
  } //_changeData

  @override
  Widget build(BuildContext context) {
    print("执行了方法===========build");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tween动画"),
      ), //AppBar
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 300.0),
          painter: new BarChartPainter(
              tween.animate(animation)
          ), //barChartPainter
        ), //CustomPaint
      ), //Container
      floatingActionButton: new FloatingActionButton(
        onPressed: _changeData,
        child: new Icon(Icons.refresh),
      ), //FloatingActionButton
    ); //Scaffold
  } //Widget build
} //_TweenDemoState






