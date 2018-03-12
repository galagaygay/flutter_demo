import 'package:flutter/material.dart';

/// BottomNavigationBar即底部导航栏控件。
/// 显示在应用底部的质感设计控件，用于在少量视图中切换。
/// 底部导航栏包含多个以标签、图标或两者搭配的形式显示在项目底部的项目，
/// 提供了应用程序的顶级视图之间的快速导航。对于较大的屏幕，侧面导航可能更好。

/// 创建类，继承StatefulWidget（有状态的控件）
class BottomNavigationBarDemo extends StatefulWidget {
  static var routeName="/BottomNavigationBarDemo";


  @override
  _BottomNavigationBarState createState() => new _BottomNavigationBarState();
}

///关联State子类的实例
///继承State：StatefulWidget（有状态的控件）逻辑和内部状态
///继承TickerProviderStateMixin，提供Ticker对象
class _BottomNavigationBarState extends State<BottomNavigationBarDemo> {

  // 类成员，存储底部导航栏的当前选择
  int _currentIndex = 0;


  // 建立过渡堆栈
  Widget _buildTransitionsStack() {
    if (_currentIndex == 0) {
      return new Text("第一个页面");
    }
    else if (_currentIndex == 1) {
      return new Text("第二个页面");
    }
    else if (_currentIndex == 2) {
      return new Text("第三个页面");
    }
    else if (_currentIndex == 3) {
      return new Text("第四个页面");
    }
    else {
      return new Text("超出定义");
    }
//    // 返回值，创建层叠布局控件
//    return new Stack(
//        children: <Widget>[
//          new Text("页面主体内容")
//        ]
//    ); //Stack
  } //_buildTransitionsStack


  @override
  Widget build(BuildContext context) {
    // 局部变量，创建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(
              Icons.access_alarm,
            ), //Icon
            title: new Text("闹钟")
        ), //BottomNavigationBarItem
        new BottomNavigationBarItem(
            icon: new Icon(Icons.cloud),
            title: new Text("天气")
        ), //BottomNavigationBarItem
        new BottomNavigationBarItem(
            icon: new Icon(Icons.print),
            title: new Text("打印机")
        ), //BottomNavigationBarItem
        new BottomNavigationBarItem(
            icon: new Icon(Icons.keyboard_voice),
            title: new Text("录音")
        ), //BottomNavigationBarItem
      ],
      //<BottomNavigationBarItem>[]
      // 底部导航栏的布局和行为：存储底部导航栏的布局和行为
      type: BottomNavigationBarType.fixed,
      // 当底部导航的类型是fixed的时候生效，用来设置图标以及文字的颜色的
      fixedColor: Colors.blue,
      // 设置当前选中的角标
      currentIndex: _currentIndex,
      // 当点击项目时调用的回调
      onTap: (int value) {
        // 通知框架此对象的内部状态已更改
        setState(() {
          // 更新存储底部导航栏的当前选择
          _currentIndex = value;
        }); // setState
      }, // onTap: (int value)
    ); // BottomNavigationBar

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
              "BottomNavigationBar"
          ), // Text
        ), // AppBar
        // 主要内容
        body: new Center(
          // 主要内容：_buildTransitionsStack函数的返回值
          child: _buildTransitionsStack(),
        ), // Center
        //水平的按钮数组，沿着程序的底部显示
        bottomNavigationBar: botNavBar
    ); // Scaffold
  }
}