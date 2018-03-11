import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

//自定义图片视图的封装
class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Material(
      // Slightly opaque color appears where the image has transparency.
      // 稍微不透明的颜色出现在图像具有透明度的地方。
      color: Theme
          .of(context)
          .primaryColor
          .withOpacity(0.25),

      child: new InkWell(
        onTap: onTap,
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return new Image.asset(
              photo,
              fit: BoxFit.contain,
            ); //Image.asset
          }, //builder: (BuildContext context, BoxConstraints size)
        ), //LayoutBuilder
      ), //InkWell
    ); //Material
  } //Widget build
}

///英雄动画，径向扩展
class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })
  //math.sqrt2--2的平方根。
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  //最大半径
  final double maxRadius;

  //剪辑矩形大小
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //创建一个椭圆形的剪辑。
    return new ClipOval(
      child: new Center(
        //创建一个固定大小的框
        child: new SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          //创建一个矩形剪辑。
          child: new ClipRect(
            child: child,
          ), //ClipRect
        ), //SizedBox
      ), //Center
    ); //ClipOval
  } //Widget build
}

//径向扩展演示
class RadialExpansionDemo extends StatelessWidget {
  //最小半径
  static const double kMinRadius = 32.0;

  //最大半径
  static const double kMaxRadius = 128.0;

  //不透明度曲线，创建一个间隔曲线
  static const opacityCurve = const Interval(
      0.0,
      0.75,
      //一条曲线运动，迅速开始&缓运动到最终位置。
      curve: Curves.fastOutSlowIn
  ); //Interval

  ///圆形==>矩形之间变换的补间动画，防止变化中发生形变
  static RectTween _createRectTween(Rect begin, Rect end) {
    //创建一个[Tween]用于沿圆弧动画[Rect]。
    return new MaterialRectCenterArcTween(
        begin: begin,
        end: end
    ); //MaterialRectCenterArcTween
  }

  ///创建点开后的页面部件
  static Widget _buildPage(BuildContext context, String imageName,
      String description) {
    return new Container(
      color: Theme
          .of(context)
          .canvasColor,
      child: new Center(
        child: new Card(
          //海拔
          elevation: 8.0,
          child: new Column(
            //主轴大小
            mainAxisSize: MainAxisSize.min,
            children: [
              new SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: new Hero(
                  //设置补间动画
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: new RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: new Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      }, //onTap
                    ), //Photo
                  ), //RadialExpansion
                ), //Hero
              ), //SizedBox
              new Text(
                //描述
                description,
                style: new TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ), //Text
              //设置一个空白的间隙
              const SizedBox(height: 16.0),
            ], //children
          ), //Column
        ), //Card
      ), //Center
    ); //Container
  } //Widget _buildPage

  //创建英雄视图控件
  Widget _buildHero(BuildContext context, String imageName,
      String description) {
    return new Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: new Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        //创建自定义的径向扩展控件
        child: new RadialExpansion(
          maxRadius: kMaxRadius,
          child: new Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                //创建一个委托给构建器回调的路由。
                new PageRouteBuilder<Null>(
                  pageBuilder: (BuildContext context,
                      //动画
                      Animation<double> animation,
                      //辅助动画
                      Animation<double> secondaryAnimation) {
                    //创建一个动画生成器。
                    return new AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          //创建不透明区域
                          return new Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          ); //Opacity
                        } //builder
                    ); //AnimatedBuilder
                  }, //pageBuilder
                ), //PageRouteBuilder
              ); //Navigator.of(context).push
            }, //onTap
          ), //Photo
        ), //RadialExpansion
      ), //Hero
    ); //Container
  } //Widget _buildHero

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 is normal animation speed.

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Radial Transition Demo'),
      ), //AppBar
      body: new Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'images/chair-alpha.png', 'Chair'),
            _buildHero(context, 'images/binoculars-alpha.png', 'Binoculars'),
            _buildHero(context, 'images/beachball-alpha.png', 'Beach ball'),
          ],
        ), //Row
      ), //Container
    ); //Scaffold
  } //Widget build
}