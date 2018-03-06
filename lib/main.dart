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
    new AppBar(
      leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: "导航栏",
          onPressed: null
      ),
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