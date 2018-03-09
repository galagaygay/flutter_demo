import 'package:flutter/material.dart';

///
///
class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => new _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶—解析动画"),
      ), //AppBar
      body: new Container(

      ), //Container
    ); //Scaffold
  } //Widget build
}