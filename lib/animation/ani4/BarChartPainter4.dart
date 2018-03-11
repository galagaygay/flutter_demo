import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/color_palette.dart';

//BarChart视图对象
class BarChart {

  //Bar的个数
  static const int barCount = 5;

  //Bar集合
  final List<Bar> bars;

  BarChart(this.bars) {
    assert(bars.length == barCount);
  }

  factory BarChart.empty(){
    return new BarChart(

      /// 创建给定长度的固定长度列表，并用fill在每个位置初始化值
      /// length必须是非负整数
        new List.filled(
            barCount,
            new Bar(0.0, Colors.transparent)
        ) //List.filled
    ); //new BarChart
  }

  factory BarChart.random(Random random){
    final Color color = ColorPalette.primary.random(random);
    return new BarChart(
      //创建给定长度的固定长度列表，并用generator创建的值在每个位置初始化值
      //创建的列表是固定长度，除非growable为true
        new List.generate(
            barCount,
                (i) =>
            new Bar(
                random.nextDouble() * 100.0,
                color
            ) //
        ) //List.filled
    ); //new BarChart
  } //BarChart.random


  static BarChart lerp(BarChart begin, BarChart end, double t) {
    return new BarChart(
        new List.generate(
            barCount,
                (i) => Bar.lerp(begin.bars[i], end.bars[i], t)
        ) //List.generate
    ); //new BarChart
  }
}

//Bar视图对象
class Bar {
  //Bar的高度
  final double barHeight;

  //控制柱状颜色
  final Color barColor;

  Bar(this.barHeight, this.barColor);

  //工厂模式，创建一个空的Bar
  factory Bar.empty() => new Bar(0.0, Colors.transparent);

  //工厂模式随即出来一个带有颜色和高度的Bar
  factory Bar.random(Random random){
    return new Bar(
        random.nextDouble() * 200.0,
        ColorPalette.primary.random(random)
    );
  }

  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar(
        lerpDouble(begin.barHeight, end.barHeight, t),
        Color.lerp(begin.barColor, end.barColor, t)
    ); //Bar
  }
}

//创建自己的补间动画
class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) :
        super(begin: begin, end: end);

  @override
  BarChart lerp(double t) => BarChart.lerp(begin, end, t);
}

//自定义的画笔，用来绘制柱状图形
class BarChartPainter extends CustomPainter {

  //定义柱状图的宽度
  static const barWidthFraction = 0.75;

  final Animation<BarChart> animation;

  BarChartPainter(Animation<BarChart> animation)
      : animation=animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    print("执行了方法===========paint");
    //绘制Bar
    void drawBar(Bar bar, double x, double width, Paint paint) {
      paint.color = bar.barColor;

      //从左边缘和上边缘，宽度和高度构造一个矩形。
      canvas.drawRect(
          new Rect.fromLTWH(
              x,
              size.height - bar.barHeight,
              width,
              bar.barHeight),
          paint);
    }

    //获取当前的BarChart
    final chart = animation.value;

    /*
      Paint：Canvas绘制时使用的样式说明
      style：是否绘制内部的形状、形状的边缘或两者都有，默认为PaintingStyle.fill
     */

    //初始化画笔，并设置颜色以及样式
    final paint = new Paint()
      ..style = PaintingStyle.fill;
    //每个条形占用的空间宽度
    final barDistance = size.width / (1 + chart.bars.length);

    //每个条形占用空间75%的宽度
    final barWidth = barDistance * barWidthFraction;

    // 用于计算每个条形的x坐标点
    var x = barDistance - barWidth / 2;
    for (final bar in chart.bars) {
      //循环绘制Bar
      drawBar(bar, x, barWidth, paint);
      //绘制完成之后将下一个Bar的x移动barDistance
      x += barDistance;
    }
  } //paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

