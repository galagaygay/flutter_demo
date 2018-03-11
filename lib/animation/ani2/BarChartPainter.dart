import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Bar {
  //Bar的高度
  final double barHeight;

  Bar(this.barHeight);

  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar(lerpDouble(begin.barHeight, end.barHeight, t));
  }
}

//创建自己的补间动画
class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) :
        super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

//自定义的画笔，用来绘制柱状图形
class BarChartPainter extends CustomPainter {

  //定义柱状图的宽度
  static const barWidth = 10.0;

  final Animation<Bar> animation;

  BarChartPainter(Animation<Bar> animation)
      : animation=animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    print("执行了方法===========paint");
    final bar = animation.value;

    //初始化画笔，并设置颜色以及样式
    final paint = new Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    //从左边缘和上边缘，宽度和高度构造一个矩形。
    canvas.drawRect(
        new Rect.fromLTWH(
            size.width - barWidth / 2,
            size.height - bar.barHeight,
            barWidth,
            bar.barHeight),
        paint);
  } //paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

