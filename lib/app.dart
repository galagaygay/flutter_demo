import 'package:flutter/material.dart';
import 'package:flutter_demo/official/item.dart';

//定义主的脚手架页面
class GalleryApp extends StatefulWidget {
  GalleryAppState createState() => new GalleryAppState();
}

//StatefulWidget[有状态控件]的逻辑和内部状态
class GalleryAppState extends State<GalleryApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //第一个位置放置了自定义的AppBar
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.menu,
            color: Colors.white,
          ), //Icon
          tooltip: "导航菜单",
          onPressed: null,
        ), //IconButton
        title: new Text("主页面"),
        centerTitle: true,
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
          ) //IconButton
        ], // <Widget>[]
      ), //AppBar
      //Column垂直布局
      body: new Container(
        child: new ListView(
          children: kMyExampleItems,
        ), //ListView
      ), //Container
      floatingActionButton: new FloatingActionButton(
          tooltip: "悬浮按钮",
          child: new IconButton(
              icon: new Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: null
          ), //IconButton
          onPressed: () {
            print("点击跳转新的页面");

            //页面跳转
            Navigator.of(context).pushNamed('/shop_page');
          } //() {}
      ), //FloatingActionButton
    ); //Scaffold
  } //Widget build
}
