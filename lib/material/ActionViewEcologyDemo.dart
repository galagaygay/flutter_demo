import 'dart:math';

import 'package:flutter/material.dart';

///LinearProgressIndicator 控件是质感设计中的线性进度指示器。
///
class ActionViewEcologyDemo extends StatefulWidget {
  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  /*
   * 构建函数，传递参数
   *  最大能量值
   *  最大饥饿值
   *  最大情绪值
   *  当前能量值
   *  当前饥饿值
   *  当前情绪值
   */
  ActionViewEcologyDemo({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  @override
  _ActionViewEcologyDemoState createState() =>
      new _ActionViewEcologyDemoState(
        maximumEmergy: maximumEmergy,
        maximumHunger: maximumHunger,
        maximumMood: maximumMood,
        currentEmergy: currentEmergy,
        currentHunger: currentHunger,
        currentMood: currentMood,
      );
}

class _ActionViewEcologyDemoState extends State<ActionViewEcologyDemo> {
  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  /*
   * 构建函数，传递参数
   *  最大能量值
   *  最大饥饿值
   *  最大情绪值
   *  当前能量值
   *  当前饥饿值
   *  当前情绪值
   */
  _ActionViewEcologyDemoState({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  // 获取进度条描述文本
  Align _getNameText(BuildContext context, String text) {
    return new Align(
      alignment: FractionalOffset.topLeft,
      child: new Text(
        text,
        style: new TextStyle(
            fontSize: 15.0,
            color: Colors.pink,
            height: 1.5
        ), // TextStyle
      ), // Text
    ); // Align
  } // Align _getNameText

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("进度条"),
      ), //AppBar
      body: new Container(
        // 创建上、下、左、右的外边局
        margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
        child: new Column(
          children: <Widget>[
            _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
            // 材料设计线性进度指示器，也称为进度条
            new LinearProgressIndicator(value: currentEmergy / maximumEmergy,),
            _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
            _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
            new LinearProgressIndicator(value: currentHunger / maximumHunger),
            _getNameText(context, '心情（$currentMood/$maximumMood）'),
            new LinearProgressIndicator(value: currentMood / maximumMood),

            new RaisedButton(
              onPressed: () {
                setState(() {
                  currentEmergy = new Random().nextInt(100);
                  currentHunger = new Random().nextInt(100);
                  currentMood = new Random().nextInt(100);
                }); //
              }, //onPressed
              child: new Text("改变进度"),
            )
          ], // <Widget>[]
        ), // Column
      ), // Container
    ); // Scaffold
  }
}