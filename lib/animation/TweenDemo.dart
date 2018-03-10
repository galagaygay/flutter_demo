import 'dart:math';

import 'package:flutter/material.dart';

/// 补间，它是构建动画代码的一个非常简单的概念，
/// 主要作用是用面向对象的方法替代之前面向过程的方法。
/// tween是一个值，它描述了其他值的空间中的两个点之间的路径，
/// 比如条形图的动画值从0运行到1。
class TweenDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TweenDemoState();
  } //createState
} //TweenDemo

class _TweenDemoState extends State<TweenDemo> with TickerProviderStateMixin {
  //随机函数
  final random = new Random();

  //接收随机数
  int dataSet = 20;

  //动画控制器
  AnimationController animation;

  //补间动画
  Tween<double> tween;


  @override
  void initState() {
    super.initState();
    print("执行了方法===========initState");

    //初始化动画控制器
    animation = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 3000)
    ); //AnimationController

    //创建Tween补间动画
    tween = new Tween<double>(
        begin: 0.0,
        end: dataSet.toDouble()
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
      dataSet = random.nextInt(200);

      //创建补间动画
      tween = new Tween<double>(
          begin: tween.evaluate(animation),
          end: dataSet.toDouble()
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


//自定义的画笔，用来绘制柱状图形
class BarChartPainter extends CustomPainter {

  //定义柱状图的宽度
  static const barWidth = 10.0;

  final Animation<double> animation;

  BarChartPainter(Animation<double> animation)
      : animation=animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    print("执行了方法===========paint");

    final barHeight = animation.value;

    //初始化画笔，并设置颜色以及样式
    final paint = new Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    //从左边缘和上边缘，宽度和高度构造一个矩形。
    canvas.drawRect(
        new Rect.fromLTWH(
            size.width - barWidth / 2,
            size.height - barHeight,
            barWidth,
            barHeight),
        paint);
  } //paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}






