import 'package:flutter/material.dart';

//Dart程序执行的主入口，就像java中的main函数一样
void main() {
  //runApp函数强制将根控件覆盖屏幕
  runApp(
      new MaterialApp(
        title: "Demo",
        //指定app启动进入的根节点视图
        home: new MainScaffold(),
      )
  );
}

//自定义标题栏
class MyAppBar extends StatelessWidget {
  final Widget title;

  //需要一个组件的构造方法
  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    //Container矩形的可视元素，返回了一个高度为56设备无关像素(device-independent pixels)的容器，
    return new Container(
      height: 56.0,
      //内部横向的左右边距为8像素(pixels)
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //BoxDecoration用来设计样式，比如背景、边框和阴影
      decoration: new BoxDecoration(
          color: Colors.blue[500]
      ),
      //设置Row(水平)布局
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: "导航菜单",
              onPressed: () {

              }),
          //中间的title控件被设置成Expanded,效果强制占满剩余空间
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "搜索",
              onPressed: () {
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text("这是标题"),
                      content: new Text("这是提示信息"),
                    )
                );
              }
          )
        ],
      ),
    );
  }
}

//定义全局的文本控件
var mTextView = new Text("你好，世界因为不同而精彩");

//定义行视图中的子元素
//var mColumnChildren=new List<Widget>{mTextView};

//定义内容展示区域
//Expanded占满剩余空间的内容区域
var mContentView = new Expanded(
  //创建了中心填充文本控件
    child: new Center(
      child: mTextView,
    )
);

//Column垂直布局
var mColumn = new Column(
  children: <Widget>[
    //第一个位置放置了自定义的AppBar
    new MyAppBar(
      title: new Text("Flutter编写的应用"),
    ),
    mContentView
  ],
);


//定义主的脚手架页面
class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: mColumn,
    );
  }
}