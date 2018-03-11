import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/color_palette.dart';

//BarChart视图对象
class BarChart {

  //Bar集合
  final List<Bar> bars;

  BarChart(this.bars);

  factory BarChart.empty(Size size){
    return new BarChart(<Bar>[]); //new BarChart
  } //BarChart.empty

  factory BarChart.random(Size size, Random random){
    //Bar宽度分数
    const barWidthFraction = 0.55;
    //最小的Bar距离
    const minBarDistance = 20.0;
    //Bar的个数
    final barCount =
        random.nextInt((size.width / minBarDistance).floor()) + 1;
    //Bar之间的距离
    final barDistance = size.width / (1 + barCount);
    //Bar的宽度
    final barWidth = barDistance * barWidthFraction;
    //Bar开始的位置
    final startX = barDistance - barWidth / 2;
    //Bar的颜色
    final color = ColorPalette.primary.random(random);
    //Bar集合
    final bars = new List.generate(
        barCount,
            (i) =>
        new Bar(
            startX + i * barDistance,
            barWidth,
            random.nextDouble() * size.height,
            color
        ) //Bar
    ); //bars

    return new BarChart(bars); //new BarChart
  } //BarChart.random


  static BarChart lerp(BarChart begin, BarChart end, double t) {
    // max：返回两个数字中较大的一个
    final barCount = max(begin.bars.length, end.bars.length);

    final bars = new List.generate(
        barCount,
            (i) =>
            Bar.lerp(
                begin._barOrNull(i),
                end._barOrNull(i),
                t
            )
    );
    return new BarChart(bars); //new BarChart
  }

  //返回指定位置的Bar，如果超出bars集合的返回null
  Bar _barOrNull(int index) => (index < bars.length ? bars[index] : null);

}

//创建自己的补间动画
class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) :
        super(begin: begin, end: end);

  @override
  BarChart lerp(double t) => BarChart.lerp(begin, end, t);
}

//Bar视图对象
class Bar {
  Bar(this.x, this.width, this.height, this.color);

  final double x;
  final double width;
  final double height;
  final Color color;

  Bar get collapsed => new Bar(x, 0.0, 0.0, color);

  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar(
        lerpDouble((begin ?? end).x, (end ?? begin).x, t),
        // ?：变量可以为null
        lerpDouble(begin?.width, end?.width, t),
        lerpDouble(begin?.height, end?.height, t),
        Color.lerp((begin ?? end).color, (end ?? begin).color, t)
    ); //Bar
  } //lerp
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) :super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

//自定义的画笔，用来绘制柱状图形
class BarChartPainter extends CustomPainter {
  final Animation<BarChart> animation;

  BarChartPainter(Animation<BarChart> animation)
      : animation=animation,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    print("执行了方法===========paint");

    //初始化画笔，并设置颜色以及样式
    final paint = new Paint()
      ..style = PaintingStyle.fill;

    //获取当前的BarChart
    final chart = animation.value;

    for (final bar in chart.bars) {
      paint..color = bar.color;

      //从左边缘和上边缘，宽度和高度构造一个矩形。
      canvas.drawRect(
          new Rect.fromLTWH(
              bar.x,
              size.height - bar.height,
              bar.width,
              bar.height
          ), //Rect.fromLTWH
          paint
      ); //drawRect
    }
  } //paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

