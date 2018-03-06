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

//定义标题栏
class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(
          color: Colors.blue[500]
      ),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: "导航菜单",
              onPressed: () {

              }),
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

//定义一个行视图
var mColumn = new Column(
  children: <Widget>[
    new MyAppBar(
      title: new Text("Flutter编写的应用"),
    ),
    new Expanded(
        child: new Center(
          child: mTextView,
        )
    )
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