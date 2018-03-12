import 'package:flutter/material.dart';

///图片英雄
class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width })
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      //限制显示区域的宽度
      width: width,
      //一个小部件，标志着它的孩子成为英雄动画的候选人。
      child: new Hero(
        // 这个特殊英雄的标识符。
        // 如果这个英雄的标签匹配我们导航到或来自的[PageRoute]上的英雄标签，那么会触发英雄动画。
        tag: photo,
        //创建一个材料
        child: new Material(
          //设置背景是透明的
          color: Colors.transparent,
          //创建一个油墨
          child: new InkWell(
            //设置点击回调
            onTap: onTap,
            //创建一个图片
            child: new Image.asset(
              //图片地址
              photo,
              //填充类型，在尽可能大的情况下仍然将源代码完全包含在目标框中。
              fit: BoxFit.contain,
            ), // new Image.asset
          ), //new InkWell
        ), // new Material
      ), //new Hero
    ); //new SizedBox
  } //Widget build
}

///英雄动画案例
class HeroAnimation extends StatelessWidget {
  static var routeName = "/HeroAnimation";


  @override
  Widget build(BuildContext context) {
    //这里更改动画的速度，会影响到全局
    //timeDilation = 5.0; // 1.0 means normal animation speed.

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ), //AppBar
      body: new Center(
        child: new PhotoHero(
          photo: 'images/flippers-alpha.png',
          //设置显示的宽度
          width: 300.0,
          //设置回调
          onTap: () {
            //使用导航
            Navigator.of(context).push(

              ///关键点，采用平台自适应转换替代整个屏幕的模态路线
                new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      //
                      return new Scaffold(
                        appBar: new AppBar(
                          title: const Text('Flippers Page'),
                        ), //Scaffold
                        body: new Container(
                          // Set background to blue to emphasize that it's a new route.
                          //将背景设置为蓝色以强调这是一条新路线。
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          //对齐方式
                          alignment: Alignment.bottomRight,
                          //创建内部的Hero组件
                          child: new PhotoHero(
                            //即是Tag也是设置在Image上的图片
                            photo: 'images/flippers-alpha.png',
                            //设置宽度
                            width: 100.0,
                            //点击的回调
                            onTap: () {
                              //回退操作
                              Navigator.of(context).pop();
                            }, //onTap
                          ), //PhotoHero
                        ), //Container
                      ); //Scaffold
                    } //builder: (BuildContext context)
                ) //MaterialPageRoute<Null>
            ); //Navigator.of(context).push
          }, //onTap
        ), //PhotoHero
      ), //Center
    ); //Scaffold
  } //Widget build
}