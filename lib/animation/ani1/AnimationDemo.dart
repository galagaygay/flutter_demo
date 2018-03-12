import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

///AnimationController的概念，用于编排动画，
/// 通过注册一个监听器，我们被告知当动画值（0.0~1.0）改变时。
/// 每当发生这种情况，我们可以像以前一样调用setState并更新 _AnimationDemoState。
///
class AnimationDemo extends StatefulWidget {
  static var routeName = "/AnimationDemo";

  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}


class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {

  // Random([int seed ])：创建一个随机数生成器
  final random = new Random();

  int dataSet = 300;

  //动画控制器
  AnimationController animationController;

  //记录开始的高度
  double startHeight;

  //记录当前的高度
  double currentHeight;

  //记录结束的高度
  double endHeight;

  //通知当前的视图状态改变
  void _changeData() {
    setState(() {
      //创建新的随机数
      dataSet = random.nextInt(300);

      //重新设置变换前起始高度
      startHeight = currentHeight;
      endHeight = dataSet.toDouble();

      //执行动画，from-开始动画的点？时间？
      animationController.forward(from: 0.0);
    }); //setState
  } //changeData

  @override
  void initState() {
    super.initState();

    //创建动画控制器
    animationController = new AnimationController(
      //https://flutter.io/tutorials/animation/
      //vsync的存在可防止离线动画消耗不必要的资源。
        vsync: this,
        //设置动画的执行时间
        duration: const Duration(milliseconds: 300)
    ) //AnimationController
    //每次动画的值改变时调用监听器。
      ..addListener(() {
        setState(() {
          //在两个数字之间进行线性插值计算
          currentHeight = lerpDouble(
              startHeight,
              endHeight,
              //动画的当前值。
              animationController.value
          ); //lerpDouble
          print("setState()=================>$currentHeight");
        }); //setState
      }) //addListener
      ..addStatusListener(
              (status) {
            print("addStatusListener=================>$status");
          }
      ) //addStatusListener
        ;

    //对数值进行初始化操作，防止为null
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();

    //开始运行此动画（转向结尾）
    animationController.forward();
  } //initState


  /*
  当该对象永久从树中删除时调用
  如果在执行完dispose之后再调用setState方法将会抛出错误，
  这里一般进行当前视图的资源释放，java中的防止内存泄露。不知道Dart有没有这个机制
  */
  @override
  void dispose() {
    //释放动画资源
    animationController.dispose();
    super.dispose();
  } //dispose

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶—解析动画"),
      ), //AppBar
      body: new Center(
        //提供画布的小部件，在绘制阶段可以绘制画布。
        child: new CustomPaint(
          size: new Size(300.0, 300.0),
          painter: new BarChartPainter(currentHeight),
        ), //CustomPaint
      ), //Container
      floatingActionButton: new FloatingActionButton(
        onPressed: _changeData,
        child: new Icon(Icons.refresh),
      ), //FloatingActionButton
    ); //Scaffold
  } //Widget build
} //_AnimationDemoState

//创建一个自定义画家。
class BarChartPainter extends CustomPainter {
  //固定Bar宽度
  static const barWidth = 10.0;

  //接收外部参数Bar的高度
  final double barHeight;

  ///a构造接收Bar的高度
  BarChartPainter(this.barHeight);

  /*
  void paint(
    Canvas canvas,
    Size size
  )
  当对象需要绘制时调用，它给出 Canvas 的坐标空间，使得原点位于框的左上角，
  框的面积是size参数的大小
   */
  @override
  void paint(Canvas canvas, Size size) {
    //简历画笔
    final paint = new Paint()
    //..直接调用的是内部的set方法，这里是链式调用
    //创建画笔颜色
      ..color = Colors.blue[400]
    //创建画笔使用的样式风格，在画布上绘制形状和路径的策略。
    //fill-填充，stroke-空心描边
      ..style = PaintingStyle.fill;

    // drawRect：使用给定的Paint绘制一个矩形，是否填充或描边（或两者）是由Paint.style控制
    canvas.drawRect(
      // Rect.fromLTWH(double left, double top, double width, double height)：
      // 从左上角和上边缘构造一个矩形，并设置其宽度和高度
        new Rect.fromLTWH(
            size.width - barWidth / 2.0,
            size.height - barHeight,
            barWidth,
            barHeight
        ), //Rect.fromLTWH
        paint
    ); //canvas.drawRect
  } //paint

  /*
  bool shouldRepaint(
    CustomPainter,
    oldDelegate
  )
  这里就判断是否需要重新绘制的，将自己对图形的重绘判断依据写在方法内部，
  如果返回true-将会调用重绘，如果返回false-将不会调用重绘机制

  如果是比较复杂的绘制，请避免重绘，这里写成false
   */
  @override
  bool shouldRepaint(BarChartPainter oldDelegate) =>
      barHeight != oldDelegate.barHeight;
} //BarChartPainter









