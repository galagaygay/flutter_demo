import 'package:flutter/material.dart';

///PopupMenuButton控件即弹出菜单控件，点击控件会出现菜单。
///
class PopupMenuButtonDemo extends StatefulWidget {
  static var routeName = "/PopupMenuButtonDemo";


  @override
  _PopupMenuDemoState createState() => new _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuButtonDemo> {
  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "PopupMenuButton"
        ), //Text
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ), //Icon
              tooltip: "搜索",
              onPressed: () {
                print("点击了搜索按钮");
              }
          ), //IconButton
          //菜单控件
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<String>>[
              new PopupMenuItem(
                child: new Text("选项一"),
                value: "选项一的值",
              ), //PopupMenuItem
              new PopupMenuItem(
                child: new Text("选项二"),
                value: "选项二的值",
              ), //PopupMenuItem
              new PopupMenuItem(
                child: new IconButton(
                    icon: new Icon(Icons.memory),
                    onPressed: null
                ), //IconButton
                value: "选项三的值",
              ), //PopupMenuItem
            ], //<PopupMenuItem<String>>[]
            onSelected: (String value) {
              setState(() {
                _bodyStr = value;
              }); //setState
            }, //(String value)
            icon: new Icon(Icons.dashboard),
          ), //PopupMenuButton
        ], //<Widget>[]
      ), //AppBar
      body: new Center(
        child: new Text(
            "选中了 $_bodyStr"
        ), //
      ), //Center
    ); //Scaffold
  }
}