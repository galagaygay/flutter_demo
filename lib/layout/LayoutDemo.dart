import 'package:flutter/material.dart';

/// 水平布局
/// Row控件即水平布局控件，能够将子控件水平排列。
///
/// Row子控件有灵活与不灵活的两种，Row首先列出不灵活的子控件，减去它们的总宽度，计算还有多少可用的空间。
/// 然后Row按照Flexible.flex属性确定的比例在可用空间中列出灵活的子控件。
/// 要控制灵活子控件,需要使用Flexible控件：
class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("水平方向布局"),
      ),
    ); //Scaffold
  } //Widget build
}