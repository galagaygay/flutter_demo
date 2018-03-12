import 'package:flutter/material.dart';

///计数器页面简单实现
///视图主体与子控件混合编写
class CounterPage1 extends StatefulWidget {
  static var routeName = "/CounterPage1";

  @override
  _CounterState1 createState() => new _CounterState1();
}

///计数器页面状态寄存器
class _CounterState1 extends State<CounterPage1> {

  //记录点击按钮的此时
  int _count = 0;

  //点击事件触发的操作
  void _increment() {
    setState(() {
      _count += 1;
    }); //setState
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("计数器简单实现"),
      ), //AppBar
      body: new Center(
        child: new Text("点击了 $_count 次按钮"),
      ), //Center
      floatingActionButton: new FloatingActionButton(
        tooltip: "增加",
        child: new Icon(Icons.add),
        onPressed: _increment,
      ), //FloatingActionButton
    ); //Scaffold
  } //Widget
}