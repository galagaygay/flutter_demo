import 'package:flutter/material.dart';

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
      body: new Column(
        children: <Widget>[
          //定义内容展示区域
          //Expanded占满剩余空间的内容区域
          new Expanded(
            //创建了中心填充文本控件
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/counter_page1');
                      },
                      child: new Text("Flutter基础—根据用户输入改变控件"),
                      //设置内边距
                      padding: const EdgeInsets.all(4.0),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/counter_page2');
                      },
                      child: new Text("Flutter基础—根据用户输入改变控件2"),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/contater_page');
                      },
                      child: new Text("Flutter基础—常用控件之容器"),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/text_widget_page');
                      },
                      child: new Text("Flutter基础—常用控件之文本"),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/image_widget_page');
                      },
                      child: new Text('Flutter基础—常用控件之图片'),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/layout_row_page');
                      },
                      child: new Text('Flutter基础—布局模型之水平Row'),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                  new Container(
                    child: new RaisedButton(
                      onPressed: () {
                        //页面跳转
                        Navigator.of(context).pushNamed('/layout_column_page');
                      },
                      child: new Text('Flutter基础—布局模型之垂直Column'),
                    ), //RaisedButton
                    margin: const EdgeInsets.all(4.0),
                  ), //Container
                ], //<Widget>[]
              ), //Column,
            ), //Center
          ), //Expanded
        ], //<Widget>[]
      ), //Column
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
