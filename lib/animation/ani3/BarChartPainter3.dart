import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/ani3/color_palette.dart';

class Bar {
  //Bar的高度
  final double barHeight;

  //控制柱状颜色
  final Color barColor;

  //工厂模式，创建一个空的Bar
  factory Bar.empty() => new Bar(0.0, Colors.transparent);

  //工厂模式随即出来一个带有颜色和高度的Bar
  factory Bar.random(Random random){
    return new Bar(
        random.nextDouble() * 200.0,
        ColorPalette.primary.random(random)
    );
  }

  Bar(this.barHeight, this.barColor);

  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar(
        lerpDouble(begin.barHeight, end.barHeight, t),
        Color.lerp(begin.barColor, end.barColor, t)
    ); //Bar
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
    //直接获取bar中的颜色
      ..color = bar.barColor
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

