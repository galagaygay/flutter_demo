import 'package:flutter/material.dart';

/// Flutter基础—根据用户输入改变控件
/// 实际开发中界面的构建是比较复杂的，如果将所有的代码直接编写在主体视图将造成阅读成本以及迭代成本增加
/// 所以这里将主体视图与内部控件进行分离
class CounterPage2 extends StatefulWidget {
  static var routeName = "/CounterPage2";

  @override
  _CounterState2 createState() => new _CounterState2();
}

class _CounterState2 extends State<CounterPage2> {
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
        title: new Text("计数器_子视图与主体分离"),
      ), //AppBar
      body: new CounterDisplay(
        count: _count,
      ), //Center
      floatingActionButton: new CounterIncrement(
        onPressed: _increment,
      ), //FloatingActionButton
    ); //Scaffold
  } //Widget
}

///将计数显示(CounterDisplay)与主体分离，这样易于维护和阅读
class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("点击了 $count 次按钮"),
    ); //Center
  } //Widget build
} //CounterDisplay

///计数改变(CounterIncrement)与主体分离，这样易于维护和阅读
class CounterIncrement extends StatelessWidget {

  //无返回值的回调事件
  final VoidCallback onPressed;

  CounterIncrement({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: onPressed,
      tooltip: "增加",
      child: new Icon(Icons.add),
      backgroundColor: Colors.black38,
    );
  } //Widget build()
}
































